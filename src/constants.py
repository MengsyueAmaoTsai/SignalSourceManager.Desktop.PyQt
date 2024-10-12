import sys

import PySide6


class ApplicationInfo:
    PYTHON_VERSION = f"{sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}"
    QT_VERSION = PySide6.__version__
