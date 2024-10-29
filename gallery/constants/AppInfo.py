from PySide6.QtCore import Property, QObject


class AppInfo(QObject):
    def __init__(self) -> None:
        super().__init__()

    @Property(str, constant=True)
    def version(self) -> str:
        return "1.0.0"

    @Property(str, constant=True)
    def python_version(self) -> str:
        import sys

        return f"{sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}"

    @Property(str, constant=True)
    def qt_version(self) -> str:
        import PySide6

        return PySide6.__version__

    @Property(str, constant=True)
    def repository(self) -> str:
        return "https://github.com/MengsyueAmaoTsai/SignalSourceManager.Desktop.PyQt"
