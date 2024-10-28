from PySide6.QtCore import Property, QObject, Signal, Slot


class MainViewModel(QObject):
    def __init__(self) -> None:
        super().__init__()

    @Slot()
    def on_application_started(self) -> None:
        print("Application started")
