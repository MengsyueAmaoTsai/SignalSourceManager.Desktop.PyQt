from PySide6.QtCore import QObject, Slot


class LogModel:
    pass


class SignalSourceModel:
    pass


class MainViewModel(QObject):
    _logs: list[LogModel] = []
    _signal_sources: list[SignalSourceModel] = []

    _websocket_client = None  ## For signal notification service
    _file_system_watcher = None  ## For file monitoring service

    def __init__(self) -> None:
        super().__init__()

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
