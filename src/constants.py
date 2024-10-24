from PySide6.QtCore import Property, QObject
from PySide6.QtGui import QColor, QFont


class ColorProvider(QObject):
    _font_primary_color = QColor(248, 248, 248)

    def __init__(self) -> None:
        super().__init__()

    @Property(QColor, constant=True)
    def font_primary_color(self) -> QColor:
        return self._font_primary_color


class FontProvider(QObject):
    DEFAULT_FONT_FAMILY = "Microsoft YaHei"

    def __init__(self) -> None:
        super().__init__()
        self._caption = QFont()
        self._caption.setFamily(self.DEFAULT_FONT_FAMILY)
        self._caption.setPixelSize(12)

        self._body = QFont()
        self._body.setFamily(self.DEFAULT_FONT_FAMILY)
        self._body.setPixelSize(13)

        self._body_strong = QFont()
        self._body_strong.setFamily(self.DEFAULT_FONT_FAMILY)
        self._body_strong.setPixelSize(13)
        self._body_strong.setWeight(QFont.Weight.DemiBold)

        self._subtitle = QFont()
        self._subtitle.setFamily(self.DEFAULT_FONT_FAMILY)
        self._subtitle.setPixelSize(20)
        self._subtitle.setWordSpacing(QFont.Weight.DemiBold)

        self._title = QFont()
        self._title.setFamily(self.DEFAULT_FONT_FAMILY)
        self._title.setPixelSize(28)
        self._title.setWeight(QFont.Weight.DemiBold)

        self._title_large = QFont()
        self._title_large.setFamily(self.DEFAULT_FONT_FAMILY)
        self._title_large.setPixelSize(40)
        self._title_large.setWeight(QFont.Weight.DemiBold)

        self._display = QFont()
        self._display.setFamily(self.DEFAULT_FONT_FAMILY)
        self._display.setPixelSize(68)
        self._display.setWeight(QFont.Weight.DemiBold)

    @Property(QFont, constant=True)
    def body(self) -> QFont:
        return self._body
