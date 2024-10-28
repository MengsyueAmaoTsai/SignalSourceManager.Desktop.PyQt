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
        "Icon": "qrc:/src/controls/base/Icon.qml",
        "TextBlock": "qrc:/src/controls/base/TextBlock.qml",
        "Button": "qrc:/src/controls/base/Button.qml",
        "TextBox": "qrc:/src/controls/base/TextBox.qml",
        "AutoSuggestBox": "qrc:/src/controls/base/AutoSuggestBox.qml",
        "ComboBox": "qrc:/src/controls/base/ComboBox.qml",
        "Progress": "qrc:/src/controls/base/Progress.qml",
        "Menu": "qrc:/src/controls/base/Menu.qml",
        "MenuItem": "qrc:/src/controls/base/MenuItem.qml",
        "Window": "qrc:/src/controls/base/Window.qml",
        "NavigationView": "qrc:/src/controls/base/NavigationView.qml",
        "Popup": "qrc:/src/controls/base/Popup.qml",
        "ComponentLoader": "qrc:/src/controls/base/ComponentLoader.qml",
        "Control": "qrc:/src/controls/base/Control.qml",
        "FocusRectangle": "qrc:/src/controls/base/FocusRectangle.qml",
        "Shadow": "qrc:/src/controls/base/Shadow.qml",
        "Background": "qrc:/src/controls/base/Background.qml",
        "TextBoxBackground": "qrc:/src/controls/base/TextBoxBackground.qml",
        "ItemDelegate": "qrc:/src/controls/base/ItemDelegate.qml",
        "ScrollBar": "qrc:/src/controls/base/ScrollBar.qml",
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
