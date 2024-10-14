from PySide6.QtQml import qmlRegisterSingletonType, qmlRegisterType

from services import ColorProvider


class QmlModuleNames:
    SERVICES = "Services"
    BASE_CONTROLS = "BaseControls"


class ServiceCollection:
    VERSION_MAJOR = 1
    VERSION_MINOR = 0

    BASE_CONTROLS = {
        "BaseLoader": "qrc:/src/controls/base/Loader.qml",
        "BaseWindow": "qrc:/src/controls/base/Window.qml",
        "BaseAppBar": "qrc:/src/controls/base/AppBar.qml",
        "BaseText": "qrc:/src/controls/base/Text.qml",
        "BaseButton": "qrc:/src/controls/base/Button.qml",
    }

    @classmethod
    def add_window_service(cls) -> None:
        qmlRegisterSingletonType(
            "qrc:/src/services/WindowService.qml",
            QmlModuleNames.SERVICES,
            cls.VERSION_MAJOR,
            cls.VERSION_MINOR,
            "WindowService",
        )

    @classmethod
    def add_color_provider(cls) -> None:
        _ = qmlRegisterSingletonType(
            ColorProvider,
            QmlModuleNames.SERVICES,
            cls.VERSION_MAJOR,
            cls.VERSION_MINOR,
            "Colors",
            lambda _: ColorProvider(),
        )

    @classmethod
    def add_base_controls(cls) -> None:
        for qml_type_name, url in cls.BASE_CONTROLS.items():
            qmlRegisterType(url, QmlModuleNames.BASE_CONTROLS, cls.VERSION_MAJOR, cls.VERSION_MINOR, qml_type_name)
