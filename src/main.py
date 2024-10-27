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
        "TextBlock": "qrc:/src/controls/base/TextBlock.qml",
        "Button": "qrc:/src/controls/base/Button.qml",
        "TextBox": "qrc:/src/controls/base/TextBox.qml",
        "ComboBox": "qrc:/src/controls/base/ComboBox.qml",
        "Popup": "qrc:/src/controls/base/Popup.qml",
        "ComponentLoader": "qrc:/src/controls/base/ComponentLoader.qml",
        "Shadow": "qrc:/src/controls/base/Shadow.qml",
        "ItemDelegate": "qrc:/src/controls/base/ItemDelegate.qml",
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
