import asyncio
from datetime import datetime

from PySide6.QtCore import Property, QObject, Slot

from resources import ResourceService


class LogModel:
    def __init__(self, time: datetime, level: str, message: str) -> None:
        self.time = time
        self.level = level
        self.message = message


class SignalSourceModel:
    def __init__(self, id: str, name: str) -> None:
        self.id = id
        self.name = name


class MainViewModel(QObject):
    _logs: list[LogModel] = []
    _signal_sources: list[SignalSourceModel] = []
    _websocket_client = None  ## For SignalR connection
    _file_system_watcher = None  ## For file monitoring service

    def __init__(self, resource_service: ResourceService) -> None:
        super().__init__()
        self._resource_service = resource_service

        self._signal_sources = [
            SignalSourceModel("TV-Long-Task", "Test"),
            SignalSourceModel("TV-Short-Task", "Test short"),
            SignalSourceModel("3", "3 test"),
        ]

    @Property("QVariantList", constant=True)
    def signal_sources(self) -> list[SignalSourceModel]:
        return self._signal_sources

    @Slot()
    def start_signal_r_connection(self) -> None:
        print("Starting SignalR connection")

    @Slot()
    def stop_signal_r_connection(self) -> None:
        print("Stopping SignalR connection")

    @Slot()
    def send_signal_r_message(self) -> None:
        print("Sending SignalR message")

    @Slot()
    def start_file_monitor_service(self) -> None:
        print("Starting file watcher")

    @Slot()
    def stop_file_monitor_service(self) -> None:
        print("Stopping file watcher")

    @Slot(str, str, str)
    def create_signal_source(self, id: str, name: str, description: str) -> None:
        asyncio.run(
            self._resource_service.create_signal_source(
                id=id,
                name=name,
                description=description,
                visibility="Public",
            )
        )
