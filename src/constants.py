from PySide6.QtCore import Property, QObject
from PySide6.QtGui import QColor


class AppTheme(QObject):
    """
    AppTheme class is a QObject that provides the color theme for the application.
    """

    def __init__(self) -> None:
        super().__init__()
