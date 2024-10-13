from PySide6.QtCore import QObject


class ColorProvider(QObject):
    def __init__(self) -> None:
        super().__init__()
