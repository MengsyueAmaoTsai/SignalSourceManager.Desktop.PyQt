from PySide6.QtQml import qmlRegisterSingletonType, qmlRegisterType


class QmlModuleNames:
    SERVICES = "RichillCapital.SignalSourceManager.Desktop.Services"
    BASE_CONTROLS = "RichillCapital.SignalSourceManager.Desktop.Controls.Base"


class ServiceCollection:
    VERSION_MAJOR = 1
    VERSION_MINOR = 0

    @classmethod
    def add_window_manager(cls) -> None:
        qmlRegisterSingletonType(
            "qrc:/src/controls/base/WindowManager.qml",
            QmlModuleNames.BASE_CONTROLS,
            cls.VERSION_MAJOR,
            cls.VERSION_MINOR,
            "WindowManager",
        )

    # @classmethod
    # def add_color_provider(cls) -> None:
    #     _ = qmlRegisterSingletonType(
    #         ColorProvider,
    #         QmlModuleNames.SERVICES,
    #         cls.VERSION_MAJOR,
    #         cls.VERSION_MINOR,
    #         "Colors",
    #         lambda _: ColorProvider(),
    #     )

    @classmethod
    def add_base_controls(cls) -> None:
        base_controls = {
            "BaseText": "qrc:/src/controls/base/Text.qml",
            "BaseButton": "qrc:/src/controls/base/Button.qml",
            "BaseTextBox": "qrc:/src/controls/base/TextBox.qml",
            "BaseWindow": "qrc:/src/controls/base/Window.qml",
            "AppBar": "qrc:/src/controls/base/AppBar.qml",
            "ComponentLoader": "qrc:/src/controls/base/ComponentLoader.qml",
        }
        for qml_type_name, url in base_controls.items():
            qmlRegisterType(url, QmlModuleNames.BASE_CONTROLS, cls.VERSION_MAJOR, cls.VERSION_MINOR, qml_type_name)
