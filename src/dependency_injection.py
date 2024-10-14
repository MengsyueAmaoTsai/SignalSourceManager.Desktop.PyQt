from PySide6.QtQml import qmlRegisterSingletonType, qmlRegisterType


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
    }

    SINGLETON_SERVICES = {
        "WindowService": "qrc:/src/WindowService.qml",
    }

    @classmethod
    def register_base_controls(cls) -> None:
        for qml_type_name, url in cls.BASE_CONTROLS.items():
            qmlRegisterType(url, QmlModuleNames.BASE_CONTROLS, cls.VERSION_MAJOR, cls.VERSION_MINOR, qml_type_name)

    @classmethod
    def register_singleton_services(cls) -> None:
        for qml_type_name, url in cls.SINGLETON_SERVICES.items():
            qmlRegisterSingletonType(url, QmlModuleNames.SERVICES, cls.VERSION_MAJOR, cls.VERSION_MINOR, qml_type_name)
