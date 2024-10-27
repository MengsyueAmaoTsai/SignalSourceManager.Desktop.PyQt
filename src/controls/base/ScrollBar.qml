import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T

T.ScrollBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding)
    visible: control.policy !== T.ScrollBar.AlwaysOff
    minimumSize: Math.max(orientation === Qt.Horizontal ? height / width : width / height, 0.3)
    verticalPadding: vertical ? 15 : 3
    horizontalPadding: horizontal ? 15 : 3
    contentItem: Item {
        implicitWidth: control.interactive ? context.maxLine : context.minLine
        implicitHeight: control.interactive ? context.maxLine : context.minLine
        states: [
            State {
                name: "show"
                when: control.contentItem.collapsed
                PropertyChanges {
                    target: scrollBarRectangle
                    width: vertical ? context.maxLine : parent.width
                    height: horizontal ? context.maxLine : parent.height
                }
            },
            State {
                name: "hide"
                when: !control.contentItem.collapsed
                PropertyChanges {
                    target: scrollBarRectangle
                    width: vertical ? context.minLine : parent.width
                    height: horizontal ? context.minLine : parent.height
                }
            }
        ]
        transitions: [
            Transition {
                to: "hide"
                SequentialAnimation {
                    PauseAnimation {
                        duration: 450
                    }
                    NumberAnimation {
                        target: scrollBarRectangle
                        properties: control.vertical ? "width" : "height"
                        duration: 167
                        easing.type: Easing.OutCubic
                    }
                }
            },
            Transition {
                to: "show"
                SequentialAnimation {
                    PauseAnimation {
                        duration: 450
                    }
                    NumberAnimation {
                        target: scrollBarRectangle
                        properties: control.vertical ? "width" : "height"
                        duration: 167
                        easing.type: Easing.OutCubic
                    }
                }
            }
        ]

        property bool collapsed: (control.policy === T.ScrollBar.AlwaysOn || (control.active && control.size < 1.0))

        Rectangle {
            id: scrollBarRectangle
            width: control.vertical ? context.minLine : parent.width
            height: control.horizontal ? context.minLine : parent.height
            color: control.pressed ? control.colorPressed : control.color
            anchors {
                right: control.vertical ? parent.right : undefined
                bottom: control.horizontal ? parent.bottom : undefined
            }
            radius: width / 2
            visible: control.size < 1.0
        }
    }
    background: Rectangle {
        id: backgroundRectangle

        radius: 5
        color: AppTheme.theme === 'Dark' ? Qt.rgba(44 / 255, 44 / 255, 44 / 255, 1) : Qt.rgba(255 / 255, 255 / 255, 255 / 255, 1)
        opacity: {
            return vertical ? context.maxLine === Number(scrollBarRectangle.width) : context.maxLine === Number(scrollBarRectangle.height);
        }
        Behavior on opacity {
            NumberAnimation {
                duration: 50
            }
        }
    }

    property color color: AppTheme.theme === 'Dark' ? Qt.rgba(159 / 255, 159 / 255, 159 / 255, 1) : Qt.rgba(138 / 255, 138 / 255, 138 / 255, 1)
    property color colorPressed: AppTheme.theme === 'Dark' ? Qt.darker(color, 1.2) : Qt.lighter(color, 1.2)

    Button {
        width: 12
        height: 12
        iconSize: 8
        verticalPadding: 0
        horizontalPadding: 0
        visible: control.horizontal
        opacity: backgroundRectangle.opacity
        anchors {
            left: parent.left
            leftMargin: 2
            verticalCenter: parent.verticalCenter
        }
        // iconColor: control.color
        // iconSource: FluentIcons.CaretLeftSolid8
        onClicked: control.decrease()
    }
    Button {
        width: 12
        height: 12
        iconSize: 8
        verticalPadding: 0
        horizontalPadding: 0
        opacity: backgroundRectangle.opacity
        anchors {
            right: parent.right
            rightMargin: 2
            verticalCenter: parent.verticalCenter
        }
        visible: control.horizontal
        // iconColor: control.color
        // iconSource: FluentIcons.CaretRightSolid8
        onClicked: control.increase()
    }
    Button {
        width: 12
        height: 12
        iconSize: 8
        verticalPadding: 0
        horizontalPadding: 0
        opacity: backgroundRectangle.opacity
        anchors {
            top: parent.top
            topMargin: 2
            horizontalCenter: parent.horizontalCenter
        }
        visible: control.vertical
        // iconColor: control.color
        // iconSource: FluentIcons.CaretUpSolid8
        onClicked: control.decrease()
    }

    Button {
        width: 12
        height: 12
        iconSize: 8
        verticalPadding: 0
        horizontalPadding: 0
        opacity: backgroundRectangle.opacity
        anchors {
            bottom: parent.bottom
            bottomMargin: 2
            horizontalCenter: parent.horizontalCenter
        }
        visible: control.vertical
        // iconColor: control.color
        // iconSource: FluentIcons.CaretDownSolid8
        onClicked: control.decrease()
    }

    QtObject {
        id: context

        property int minLine: 2
        property int maxLine: 6
    }
}
