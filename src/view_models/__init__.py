import asyncio

from PySide6.QtCore import Property, QObject, Signal, Slot

from constants import ApplicationInfo
from resources import ResourceService


class MainViewModel(QObject):
    signal_sources_changed = Signal()

    _signal_sources = []

    def __init__(self, resource_service: ResourceService) -> None:
        super().__init__()
        self._resource_service = resource_service

    @Property(str)
    def application_version(self) -> str:
        return ApplicationInfo.VERSION

    @Property(str)
    def app_title(self) -> str:
        return f"{ApplicationInfo.ID} {ApplicationInfo.VERSION}"

    @Property(str)
    def qt_version(self) -> str:
        return ApplicationInfo.QT_VERSION

    @Slot()
    def initialize(self) -> None:
        asyncio.run(self._fetch_initial_data())

    async def _fetch_initial_data(self) -> None:
        self._signal_sources = await self._resource_service.list_signal_sources()
        print(self._signal_sources)
