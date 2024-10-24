from PySide6.QtQml import qmlRegisterSingletonType, qmlRegisterType


class QmlModuleNames:
    SERVICES = "RichillCapital.SignalSourceManager.Desktop.Services"
    BASE_CONTROLS = "RichillCapital.SignalSourceManager.Desktop.Controls.Base"


class ServiceCollection:
    VERSION_MAJOR = 1
    VERSION_MINOR = 0

    # @classmethod
    # def add_window_service(cls) -> None:
    #     qmlRegisterSingletonType(
    #         "qrc:/src/services/WindowService.qml",
    #         QmlModuleNames.SERVICES,
    #         cls.VERSION_MAJOR,
    #         cls.VERSION_MINOR,
    #         "WindowService",
    #     )

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
            "BaseTable": "qrc:/src/controls/base/Table.qml",
            "Pagination": "qrc:/src/controls/base/Pagination.qml",
            "ComponentLoader": "qrc:/src/controls/base/ComponentLoader.qml",
        }
        for qml_type_name, url in base_controls.items():
            qmlRegisterType(url, QmlModuleNames.BASE_CONTROLS, cls.VERSION_MAJOR, cls.VERSION_MINOR, qml_type_name)
