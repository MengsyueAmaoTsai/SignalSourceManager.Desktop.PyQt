import sys

from PySide6.QtCore import QProcess
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterSingletonType, qmlRegisterType
from PySide6.QtQuick import QQuickWindow, QSGRendererInterface
from PySide6.QtQuickControls2 import QQuickStyle

import resources_rc as resources  # type: ignore # noqa: F401
from constants import AppFont, AppTheme

app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()

# Register presentation layer services
MODULE_VERSION_MAJOR = 1
MODULE_VERSION_MINOR = 0

## Add custom QML module: RichillCapital.SignalSourceManager.Desktop.Controls.Base
BASE_CONTROLS = {
    "AppTitleBar": "qrc:/src/controls/base/AppTitleBar.qml",
    "Button": "qrc:/src/controls/base/Button.qml",
    "TextBlock": "qrc:/src/controls/base/TextBlock.qml",
    "TextBox": "qrc:/src/controls/base/TextBox.qml",
    "AutoSuggestBox": "qrc:/src/controls/base/AutoSuggestBox.qml",
    "NavigationView": "qrc:/src/controls/base/NavigationView.qml",
    "NavigationViewItem": "qrc:/src/controls/base/NavigationViewItem.qml",
    "WindowManager": "qrc:/src/controls/base/WindowManager.qml",
    "Window": "qrc:/src/controls/base/Window.qml",
    "ContentDialog": "qrc:/src/controls/base/ContentDialog.qml",
    "TableView": "qrc:/src/controls/base/TableView.qml",
    "MenuBar": "qrc:/src/controls/base/MenuBar.qml",
    "MenuBarItem": "qrc:/src/controls/base/MenuBarItem.qml",
    "Menu": "qrc:/src/controls/base/Menu.qml",
    "Object": "qrc:/src/controls/base/Object.qml",
    "Shadow": "qrc:/src/controls/base/Shadow.qml",
    "ComponentLoader": "qrc:/src/controls/base/ComponentLoader.qml",
}
BASE_CONTROLS_MODULE_NAME = "RichillCapital.SignalSourceManager.Desktop.Controls.Base"

for control_name, url in BASE_CONTROLS.items():
    qmlRegisterType(url, BASE_CONTROLS_MODULE_NAME, MODULE_VERSION_MAJOR, MODULE_VERSION_MINOR, control_name)

qmlRegisterSingletonType(
    "qrc:/src/controls/base/WindowManager.qml",
    BASE_CONTROLS_MODULE_NAME,
    MODULE_VERSION_MAJOR,
    MODULE_VERSION_MINOR,
    "WindowManager",
)

# Register context properties or objects
theme = AppTheme()
engine.rootContext().setContextProperty("AppTheme", theme)

font = AppFont()
engine.rootContext().setContextProperty("AppFont", font)

for path in engine.importPathList():
    print(f"Import path: {path}")

QQuickWindow.setGraphicsApi(QSGRendererInterface.GraphicsApi.OpenGL)

QQuickStyle.setStyle("Basic")
QQuickStyle.setFallbackStyle("Basic")

QGuiApplication.setQuitOnLastWindowClosed(True)
QGuiApplication.setOrganizationName("RichillCapital")
QGuiApplication.setOrganizationDomain("https://community.richillcapital.com")
QGuiApplication.setApplicationName("QML Control Gallery")

engine.load("qrc:/gallery/App.qml")

if not engine.rootObjects():
    sys.exit(-1)

code = app.exec()

if code == 931:
    args = QGuiApplication.arguments()[1:]
    _ = QProcess.startDetached(QGuiApplication.applicationFilePath(), args)

sys.exit(code)
