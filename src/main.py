import asyncio
import os
import sys
from pathlib import Path

import httpx
from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine


class MainViewModel(QObject):
    _signal_sources = []

    def __init__(self) -> None:
        super().__init__()

    @Slot()
    def load_data(self) -> None:
        print("Loading data...")
        asyncio.run(self._load_data())

    async def _load_data(self) -> None:
        url = "https://api.richillcapital.com/api/v1/signal-sources"

        async with httpx.AsyncClient(verify=False) as http_client:
            try:
                response = await http_client.get(url)

                if response.status_code >= 400:
                    print(f"Error: {response.status_code}")
                    return

                self._signal_sources = response.json()
                print("Signal source loaded!")

            except Exception as e:
                print(f"Error loading data: {e}")


app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

main_view_model = MainViewModel()

qml_file = Path(os.getcwd()) / "src" / "App.qml"

engine.rootContext().setContextProperty("mainViewModel", main_view_model)
engine.load(str(qml_file))


if __name__ == "__main__":
    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
