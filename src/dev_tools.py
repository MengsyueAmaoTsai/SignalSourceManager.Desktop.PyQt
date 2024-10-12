import os
from pathlib import Path

from PySide6.QtCore import QObject, Slot
from PySide6.QtQml import QQmlApplicationEngine


class DevTool(QObject):
    def __init__(self, engine: QQmlApplicationEngine) -> None:
        super().__init__()
        self._engine = engine

    @Slot()
    def reload(self) -> None:
        for obj in self._engine.rootObjects():
            obj.deleteLater()

        self._engine.clearComponentCache()

        self._engine.load(Path(os.getcwd()) / "src" / "App.qml")
