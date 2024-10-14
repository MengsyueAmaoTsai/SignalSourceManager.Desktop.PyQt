import sys

from PySide6.QtCore import QProcess
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuick import QQuickWindow, QSGRendererInterface
from PySide6.QtQuickControls2 import QQuickStyle

import resources_rc as resources  # type: ignore # noqa: F401
from AppInfo import AppInfo
from dependency_injection import ServiceCollection

app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

app_info = AppInfo()
engine.rootContext().setContextProperty("AppInfo", app_info)

version_major = 1
version_minor = 0

# Register presentation layer services
ServiceCollection.register_singleton_services()
ServiceCollection.register_base_controls()
ServiceCollection.register_theme_manager()
for path in engine.importPathList():
    print(f"Import path: {path}")

QQuickWindow.setGraphicsApi(QSGRendererInterface.GraphicsApi.OpenGL)

QQuickStyle.setStyle("Basic")
QQuickStyle.setFallbackStyle("Basic")

QGuiApplication.setOrganizationName("RichillCapital")
QGuiApplication.setOrganizationDomain("https://community.richillcapital.com")
QGuiApplication.setApplicationName(f"RichillCapital.SignalSourceManager.Desktop - {app_info.version}")

engine.load("qrc:/src/App.qml")

if not engine.rootObjects():
    sys.exit(-1)

code = app.exec()
if code == 931:
    args = QGuiApplication.arguments()[1:]
    _ = QProcess.startDetached(QGuiApplication.applicationFilePath(), args)

sys.exit(code)
