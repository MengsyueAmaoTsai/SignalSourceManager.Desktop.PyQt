from PySide6.QtCore import Property, QObject
from PySide6.QtGui import QColor


class AppColors(QObject):
    """Application color constants"""

    def __init__(self) -> None:
        super().__init__()
        self._font_primary_color = QColor(248, 248, 248)

    @Property(QColor, constant=True)
    def font_primary_color(self) -> QColor:
        return self._font_primary_color
