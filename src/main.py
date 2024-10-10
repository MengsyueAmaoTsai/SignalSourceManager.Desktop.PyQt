import os
import sys
from pathlib import Path

from PySide6.QtCore import QObject
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine


class MainViewModel(QObject):
    def __init__(self) -> None:
        super().__init__()


app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

qml_file = Path(os.getcwd()) / "src" / "App.qml"
engine.load(str(qml_file))

main_view_model = MainViewModel()
engine.rootContext().setContextProperty("mainViewModel", main_view_model)

if __name__ == "__main__":
    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
