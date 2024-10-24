from PySide6.QtCore import Property, QObject, Slot


class LogModel:
    pass


class SignalSourceModel:
    def __init__(self, id: str, name: str) -> None:
        self.id = id
        self.name = name


class MainViewModel(QObject):
    _logs: list[LogModel] = []
    _signal_sources: list[SignalSourceModel] = []

    _websocket_client = None  ## For signal notification service
    _file_system_watcher = None  ## For file monitoring service

    def __init__(self) -> None:
        super().__init__()
        self._signal_sources = [SignalSourceModel("TV-Long-Task", "Test")]

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