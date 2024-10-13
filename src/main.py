import json
import sys

from PySide6.QtCore import QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterType

import resources_rc  # type: ignore # noqa: F401
from dev_tools import DevTool
from hosting import environment
from resources import ResourceOptions, ResourceService
from view_models import MainViewModel


class DesktopApplication:
    _qt_application = QGuiApplication(sys.argv)
    _engine: QQmlApplicationEngine = QQmlApplicationEngine()
    _resource_service: ResourceService  # type: ignore
    _main_view_model: MainViewModel  # type: ignore

    def __init__(self) -> None:
        self.__setup_dev_tool()
        ## Domain

        ## Application

        ## Infrastructure - Resource services
        self.__add_resources()

        ## Presentation - ViewModels
        self.__add_view_models()

    def __setup_dev_tool(self) -> None:
        if not environment.is_production():
            self._dev_tool = DevTool(self._engine)
            self._engine.rootContext().setContextProperty("devTool", self._dev_tool)

    def __add_resources(self) -> None:
        resource_options: ResourceOptions
        appsettings_file = (
            environment.is_production() and "appsettings.json" or f"appsettings.{environment.environment_name}.json"
        )

        with open(environment.content_root_path / appsettings_file) as f:
            app_settings = json.load(f)
            resource_options = ResourceOptions(**app_settings[ResourceOptions.SECTION_KEY])

        self._resource_service = ResourceService(resource_options.base_address)

    def __add_view_models(self) -> None:
        self._main_view_model = MainViewModel(self._resource_service)
        self._engine.rootContext().setContextProperty("mainViewModel", self._main_view_model)

    def run(self) -> None:
        self.__setup_qml()

        if not self._engine.rootObjects():
            sys.exit(-1)

        sys.exit(self._qt_application.exec())

    def __setup_qml(self) -> None:
        # Register qml types
        self.__register_base_controls()

        ## Load App.qml
        url = QUrl("qrc:/src/App.qml")
        self._engine.load(url)

    def __register_base_controls(self) -> None:
        module_name = "BaseControls"
        version_major = 1
        version_minor = 0

        qmlRegisterType(
            QUrl("qrc:/src/controls/base/Divider.qml"), module_name, version_major, version_minor, "BaseDivider"
        )

        qmlRegisterType(
            QUrl("qrc:/src/controls/base/Button.qml"), module_name, version_major, version_minor, "BaseButton"
        )

        qmlRegisterType(QUrl("qrc:/src/controls/base/Text.qml"), module_name, version_major, version_minor, "BaseText")

        qmlRegisterType(QUrl("qrc:/src/controls/base/Icon.qml"), module_name, version_major, version_minor, "BaseIcon")

        qmlRegisterType(
            QUrl("qrc:/src/controls/base/CheckBox.qml"), module_name, version_major, version_minor, "BaseCheckBox"
        )

        qmlRegisterType(
            QUrl("qrc:/src/controls/base/Rectangle.qml"), module_name, version_major, version_minor, "BaseRectangle"
        )

        qmlRegisterType(
            QUrl("qrc:/src/controls/base/Window.qml"), module_name, version_major, version_minor, "BaseWindow"
        )


if __name__ == "__main__":
    desktop = DesktopApplication()
    desktop.run()
