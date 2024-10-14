from PySide6.QtCore import QFileSystemWatcher, QMutex, QObject
from PySide6.QtGui import QColor
from PySide6.QtQml import qmlRegisterSingletonType, qmlRegisterType


class QmlModuleNames:
    SERVICES = "Services"
    BASE_CONTROLS = "BaseControls"


class ColorProvider(QObject):
    def __init__(self) -> None:
        super().__init__()
        self._accent_color = QColor(0, 122, 204)
        self._theme = "Light"
        self._use_native_text = False
        self._animation_enabled = True
        # self._system_dark = system_dark()
        self._desktop_image_path = ""
        self._blur_behind_window_enabled = False
        self._watcher = QFileSystemWatcher()
        self._mutex = QMutex()


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

    SINGLETON_SERVICES = {
        "WindowService": "qrc:/src/services/WindowService.qml",
    }

    @classmethod
    def register_theme_manager(cls) -> None:
        qmlRegisterSingletonType(
            ColorProvider,
            QmlModuleNames.SERVICES,
            cls.VERSION_MAJOR,
            cls.VERSION_MINOR,
            "Colors",
            lambda _: ColorProvider(),
        )

    @classmethod
    def register_base_controls(cls) -> None:
        for qml_type_name, url in cls.BASE_CONTROLS.items():
            qmlRegisterType(url, QmlModuleNames.BASE_CONTROLS, cls.VERSION_MAJOR, cls.VERSION_MINOR, qml_type_name)

    @classmethod
    def register_singleton_services(cls) -> None:
        for qml_type_name, url in cls.SINGLETON_SERVICES.items():
            qmlRegisterSingletonType(url, QmlModuleNames.SERVICES, cls.VERSION_MAJOR, cls.VERSION_MINOR, qml_type_name)
