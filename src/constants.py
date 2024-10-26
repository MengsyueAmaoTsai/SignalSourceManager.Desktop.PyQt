from enum import Enum
from threading import Lock

from PySide6.QtCore import Property, QObject
from PySide6.QtGui import QColor, QFont, QGuiApplication, QPalette


class Themes(Enum):
    Dark = "Dark"
    Light = "Light"
    System = "System"


class AppTheme(QObject):
    """
    AppTheme class is a QObject that provides the color theme for the application.
    """

    def __init__(self) -> None:
        super().__init__()
        self._accent_color = QColor(0, 122, 204)
        self._theme = Themes.Light
        self._render_native_text = False
        self._animation_enabled = True
        self._system_theme = self.get_system_theme()
        self._desktop_image_path = ""
        self._blur_behind_window_enabled = False
        self._mutex = Lock()

        QGuiApplication.instance().installEventFilter(self)

        is_dark = self._theme is Themes.Dark

        self._primary_color = self._accent_color.lighter() if is_dark else self._accent_color.darker()
        self._background_color = QColor(0, 0, 0) if is_dark else QColor(255, 255, 255)
        self._divider_color = QColor(80, 80, 80) if is_dark else QColor(210, 210, 210)
        self._window_background_color = QColor(32, 32, 32) if is_dark else QColor(237, 237, 237)
        self._window_active_background_color = QColor(26, 26, 26) if is_dark else QColor(243, 243, 243)
        self._font_primary_color = QColor(248, 248, 248) if is_dark else QColor(7, 7, 7)
        self._item_hover_color = QColor(255, 255, 255, 15) if is_dark else QColor(0, 0, 0, 8)
        # Connect signals

        # Timer

    @classmethod
    def get_system_theme(cls) -> Themes:
        palette = QGuiApplication.palette()
        color = palette.color(QPalette.ColorRole.Window)

        return (
            Themes.Dark
            if color.red() * 0.2126 + color.green() * 0.7152 + color.blue() * 0.0722 <= 255.0 / 2
            else Themes.Light
        )

    @Property(str, constant=True)
    def theme(self) -> str:
        return self._theme.value

    @Property(bool, constant=True)
    def render_native_text(self) -> bool:
        return self._render_native_text

    @Property(QColor, constant=True)
    def font_primary_color(self) -> QColor:
        return self._font_primary_color

    @Property(QColor, constant=True)
    def window_background_color(self) -> QColor:
        return self._window_background_color

    @Property(QColor, constant=True)
    def window_active_background_color(self) -> QColor:
        return self._window_active_background_color


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
