import json
import os
import sys
from argparse import ArgumentParser
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from resources import ResourceOptions, ResourceService
from view_models import MainViewModel

parser = ArgumentParser(description="Run the application.")
_ = parser.add_argument(
    "--environment",
    "-e",
    type=str,
    default="Development",
    help="Specify the environment to run the application (default: Development)",
)

args = parser.parse_args()
environment = args.environment
print("Running in environment:", environment)

content_root_path = Path(os.getcwd())

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()

## Infrastructure - Resource services
resource_options: ResourceOptions

appsettings_file = environment == "Production" and "appsettings.json" or f"appsettings.{environment}.json"

with open(content_root_path / appsettings_file) as f:
    app_settings = json.load(f)
    resource_options = ResourceOptions(**app_settings[ResourceOptions.SECTION_KEY])

resource_service = ResourceService(resource_options.base_address)

# Presentation - MVVM
main_view_model = MainViewModel(resource_service)
engine.rootContext().setContextProperty("mainViewModel", main_view_model)

# Load QML file
qml_file = content_root_path / "src" / "App.qml"
engine.load(str(qml_file))


if __name__ == "__main__":
    if not engine.rootObjects():
        sys.exit(-1)

    exit_code = app.exec()

    del engine
    sys.exit()
