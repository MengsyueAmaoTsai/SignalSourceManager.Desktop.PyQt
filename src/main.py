import sys

from PySide6.QtCore import QProcess
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuick import QQuickWindow, QSGRendererInterface
from PySide6.QtQuickControls2 import QQuickStyle

import resources_rc as resources  # type: ignore # noqa: F401
from AppInfo import AppInfo, QtResources
from constants import ColorProvider, FontProvider
from dependency_injection import ServiceCollection
from view_models import MainViewModel

app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()


# Register presentation layer services
ServiceCollection.add_base_controls()
ServiceCollection.add_window_manager()

for path in engine.importPathList():
    print(f"Import path: {path}")

app_info = AppInfo()
engine.rootContext().setContextProperty("app_info", app_info)

main_view_model = MainViewModel()
engine.rootContext().setContextProperty("main_view_model", main_view_model)

color_provider = ColorProvider()
engine.rootContext().setContextProperty("color_provider", color_provider)

font_provider = FontProvider()
engine.rootContext().setContextProperty("font_provider", font_provider)

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
