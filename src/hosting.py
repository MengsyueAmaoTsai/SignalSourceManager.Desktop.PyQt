import os
from argparse import ArgumentParser
from dataclasses import dataclass
from pathlib import Path

from constants import ApplicationInfo

parser = ArgumentParser(description="Run the application.")
_ = parser.add_argument(
    "--environment",
    "-e",
    type=str,
    default="Development",
    help="Specify the environment to run the application (default: Development)",
)

args = parser.parse_args()


@dataclass(frozen=True)
class HostEnvironment:
    environment_name: str
    application_name: str
    content_root_path: Path

    def is_production(self) -> bool:
        return self.environment_name == "Production"


environment = HostEnvironment(
    application_name=ApplicationInfo.ID, environment_name=args.environment, content_root_path=Path(os.getcwd())
)
