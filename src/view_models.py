import asyncio
import sys

import PySide6
from PySide6.QtCore import Property, QObject, Slot

from resources import ResourceService


class MainViewModel(QObject):
    _signal_sources = []

    def __init__(self, resource_service: ResourceService) -> None:
        super().__init__()
        self._resource_service = resource_service

    @Property(str)
    def python_version(self) -> str:
        return f"{sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}"

    @Property(str)
    def qt_version(self) -> str:
        return PySide6.__version__

    @Slot()
    def load_data(self) -> None:
        asyncio.run(self._load_data())

    async def _load_data(self) -> None:
        self._signal_sources = await self._resource_service.list_signal_sources()
        print(self._signal_sources)
