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
    "Object": "qrc:/src/controls/base/Object.qml",
    "FocusRectangle": "qrc:/src/controls/base/FocusRectangle.qml",
    "Shadow": "qrc:/src/controls/base/Shadow.qml",
    "Background": "qrc:/src/controls/base/Background.qml",
    "TextBoxBackground": "qrc:/src/controls/base/TextBoxBackground.qml",
    "ItemDelegate": "qrc:/src/controls/base/ItemDelegate.qml",
    "Divider": "qrc:/src/controls/base/Divider.qml",
    "ComponentLoader": "qrc:/src/controls/base/ComponentLoader.qml",
    "Window": "qrc:/src/controls/base/Window.qml",
    "Popup": "qrc:/src/controls/base/Popup.qml",
    "ContentDialog": "qrc:/src/controls/base/ContentDialog.qml",
    "Page": "qrc:/src/controls/base/Page.qml",
    "ScrollablePage": "qrc:/src/controls/base/ScrollablePage.qml",
    "Frame": "qrc:/src/controls/base/Frame.qml",
    "Clip": "qrc:/src/controls/base/Clip.qml",
    "Acrylic": "qrc:/src/controls/base/Acrylic.qml",
    "Icon": "qrc:/src/controls/base/Icon.qml",
    "TextBlock": "qrc:/src/controls/base/TextBlock.qml",
    "Button": "qrc:/src/controls/base/Button.qml",
    "TextBox": "qrc:/src/controls/base/TextBox.qml",
    "ComboBox": "qrc:/src/controls/base/ComboBox.qml",
    "Progress": "qrc:/src/controls/base/Progress.qml",
    "Badge": "qrc:/src/controls/base/Badge.qml",
    "Tooltip": "qrc:/src/controls/base/Tooltip.qml",
    "ScrollBar": "qrc:/src/controls/base/ScrollBar.qml",
    ## Pages
    "TextBlockPage": "qrc:/gallery/pages/TextBlockPage.qml",
    "ButtonPage": "qrc:/gallery/pages/ButtonPage.qml",
    "ComboBoxPage": "qrc:/gallery/pages/ComboBoxPage.qml",
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
