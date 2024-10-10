import asyncio

from PySide6.QtCore import QObject, Slot

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
