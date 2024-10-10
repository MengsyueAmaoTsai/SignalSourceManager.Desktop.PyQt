import asyncio
import os
import sys
from pathlib import Path

import httpx
from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from resources import ResourceService


class MainViewModel(QObject):
    _signal_sources = []

    def __init__(self, resource_service: ResourceService) -> None:
        super().__init__()
        self._resource_service = resource_service

    @Slot()
    def load_data(self) -> None:
        asyncio.run(self._load_data())

    async def _load_data(self) -> None:
        self._signal_sources = await self._resource_service.list_signal_sources()
        print(self._signal_sources)


app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

resource_service = ResourceService()
main_view_model = MainViewModel(resource_service)

qml_file = Path(os.getcwd()) / "src" / "App.qml"

engine.rootContext().setContextProperty("mainViewModel", main_view_model)
engine.load(str(qml_file))


if __name__ == "__main__":
    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
