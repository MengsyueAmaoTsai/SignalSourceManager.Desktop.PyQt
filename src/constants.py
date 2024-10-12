import sys

import PySide6


class ApplicationInfo:
    ID = "RichillCapital.SignalSourceManager.Desktop"
    VERSION = "1.0.0"
    PYTHON_VERSION = f"{sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}"
    QT_VERSION = PySide6.__version__
