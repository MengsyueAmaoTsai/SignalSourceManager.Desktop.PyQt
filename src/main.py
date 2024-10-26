import sys

from PySide6.QtCore import QProcess
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterType
from PySide6.QtQuick import QQuickWindow, QSGRendererInterface
from PySide6.QtQuickControls2 import QQuickStyle

import resources_rc as resources  # type: ignore # noqa: F401
from constants import AppFont, AppTheme


def services_add_base_controls(
    module_name: str = "RichillCapital.SignalSourceManager.Desktop.Controls.Base",
    version_major: int = 1,
    version_minor: int = 0,
) -> None:
    # qmlRegisterSingletonType(
    #     "qrc:/src/controls/base/WindowManager.qml",
    #     module_name,
    #     version_major,
    #     version_minor,
    #     "WindowManager",
    # )

    controls = {
        "AppTitleBar": "qrc:/src/controls/base/AppTitleBar.qml",
        "Button": "qrc:/src/controls/base/Button.qml",
        "TextBlock": "qrc:/src/controls/base/TextBlock.qml",
        "NavigationView": "qrc:/src/controls/base/NavigationView.qml",
        "WindowManager": "qrc:/src/controls/base/WindowManager.qml",
        "Window": "qrc:/src/controls/base/Window.qml",
        "ContentDialog": "qrc:/src/controls/base/ContentDialog.qml",
        "TableView": "qrc:/src/controls/base/TableView.qml",
        "ComponentLoader": "qrc:/src/controls/base/ComponentLoader.qml",
    }

    for control_name, url in controls.items():
        qmlRegisterType(url, module_name, version_major, version_minor, control_name)


app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

# Register presentation layer services
services_add_base_controls()

# Register context properties or objects
theme = AppTheme()
font = AppFont()

engine.rootContext().setContextProperty("AppTheme", theme)
engine.rootContext().setContextProperty("AppFont", font)

for path in engine.importPathList():
    print(f"Import path: {path}")

QQuickWindow.setGraphicsApi(QSGRendererInterface.GraphicsApi.OpenGL)

QQuickStyle.setStyle("Basic")
QQuickStyle.setFallbackStyle("Basic")

QGuiApplication.setQuitOnLastWindowClosed(True)
QGuiApplication.setOrganizationName("RichillCapital")
QGuiApplication.setOrganizationDomain("https://community.richillcapital.com")
QGuiApplication.setApplicationName("RichillCapital.SignalSourceManager.Desktop")

engine.load("qrc:/src/App.qml")

if not engine.rootObjects():
    sys.exit(-1)

code = app.exec()

if code == 931:
    args = QGuiApplication.arguments()[1:]
    _ = QProcess.startDetached(QGuiApplication.applicationFilePath(), args)

sys.exit(code)
