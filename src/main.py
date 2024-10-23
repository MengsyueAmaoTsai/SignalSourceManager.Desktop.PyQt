import sys

from PySide6.QtCore import QProcess
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuick import QQuickWindow, QSGRendererInterface
from PySide6.QtQuickControls2 import QQuickStyle

import resources_rc as resources  # type: ignore # noqa: F401
from AppInfo import AppInfo, QtResources
from dependency_injection import ServiceCollection
from view_models import MainViewModel

app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

app_info = AppInfo()
engine.rootContext().setContextProperty("AppInfo", app_info)

version_major = 1
version_minor = 0

# Register presentation layer services

# for path in engine.importPathList():
#     print(f"Import path: {path}")

main_view_model = MainViewModel()
engine.rootContext().setContextProperty("main_view_model", main_view_model)

QQuickWindow.setGraphicsApi(QSGRendererInterface.GraphicsApi.OpenGL)

QQuickStyle.setStyle("Basic")
QQuickStyle.setFallbackStyle("Basic")

QGuiApplication.setQuitOnLastWindowClosed(True)
QGuiApplication.setOrganizationName("RichillCapital")
QGuiApplication.setOrganizationDomain("https://community.richillcapital.com")
QGuiApplication.setApplicationName(f"RichillCapital.SignalSourceManager.Desktop - {app_info.version}")

engine.load(QtResources.APP)

if not engine.rootObjects():
    sys.exit(-1)

code = app.exec()

if code == 931:
    args = QGuiApplication.arguments()[1:]
    _ = QProcess.startDetached(QGuiApplication.applicationFilePath(), args)

sys.exit(code)
