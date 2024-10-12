import json
import os
import sys
from argparse import ArgumentParser
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from dev_tools import DevTool
from resources import ResourceOptions, ResourceService
from view_models import MainViewModel

parser = ArgumentParser(description="Run the application.")
_ = parser.add_argument(
    "--environment",
    "-e",
    type=str,
    default="Development",
    help="Specify the environment to run the application (default: Development)",
)

args = parser.parse_args()
environment = args.environment
content_root_path = Path(os.getcwd())


class DesktopApplication:
    _qt_application = QGuiApplication(sys.argv)
    _engine: QQmlApplicationEngine = QQmlApplicationEngine()
    _resource_service: ResourceService  # type: ignore
    _main_view_model: MainViewModel  # type: ignore

    def __init__(self) -> None:
        if environment != "Production":
            self._dev_tool = DevTool(self._engine)
            self._engine.rootContext().setContextProperty("devTool", self._dev_tool)

        ## Infrastructure - Resource services
        self.__add_resources()

        ## Presentation - MVVM
        self.__add_mvvm()

    def __add_resources(self) -> None:
        resource_options: ResourceOptions
        appsettings_file = environment == "Production" and "appsettings.json" or f"appsettings.{environment}.json"

        with open(content_root_path / appsettings_file) as f:
            app_settings = json.load(f)
            resource_options = ResourceOptions(**app_settings[ResourceOptions.SECTION_KEY])

        self._resource_service = ResourceService(resource_options.base_address)

    def __add_mvvm(self) -> None:
        self._main_view_model = MainViewModel(self._resource_service)
        self._engine.rootContext().setContextProperty("mainViewModel", self._main_view_model)

    def __load_qml(self) -> None:
        qml_file = content_root_path / "src" / "App.qml"
        self._engine.load(str(qml_file))

    def run(self) -> None:
        self.__load_qml()

        if not self._engine.rootObjects():
            sys.exit(-1)

        sys.exit(self._qt_application.exec())


if __name__ == "__main__":
    desktop = DesktopApplication()
    desktop.run()
