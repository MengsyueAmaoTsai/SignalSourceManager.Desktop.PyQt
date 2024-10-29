from PySide6.QtCore import Property, QObject
from PySide6.QtGui import QFont


class AppFont(QObject):
    DEFAULT_FONT_FAMILY = "Microsoft YaHei UI"

    def __init__(self) -> None:
        super().__init__()
        self._caption = QFont(self.DEFAULT_FONT_FAMILY, 12)
        self._body = QFont(self.DEFAULT_FONT_FAMILY, 13)
        self._body_strong = QFont(self.DEFAULT_FONT_FAMILY, 13, QFont.Weight.DemiBold)
        self._subtitle = QFont(self.DEFAULT_FONT_FAMILY, 20, QFont.Weight.DemiBold)
        self._title = QFont(self.DEFAULT_FONT_FAMILY, 28, QFont.Weight.DemiBold)
        self._title_large = QFont(self.DEFAULT_FONT_FAMILY, 40, QFont.Weight.DemiBold)
        self._display = QFont(self.DEFAULT_FONT_FAMILY, 68, QFont.Weight.DemiBold)

    @Property(QFont, constant=True)
    def caption(self) -> QFont:
        return self._caption

    @Property(QFont, constant=True)
    def body(self) -> QFont:
        return self._body

    @Property(QFont, constant=True)
    def body_strong(self) -> QFont:
        return self._body_strong

    @Property(QFont, constant=True)
    def subtitle(self) -> QFont:
        return self._subtitle

    @Property(QFont, constant=True)
    def title(self) -> QFont:
        return self._title

    @Property(QFont, constant=True)
    def title_large(self) -> QFont:
        return self._title_large

    @Property(QFont, constant=True)
    def display(self) -> QFont:
        return self._display
