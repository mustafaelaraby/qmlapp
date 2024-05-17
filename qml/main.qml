import QtQuick
Window {
    id: rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("QML Syntax Demo")
    Row {
        id: row1
        anchors.centerIn: parent
        spacing: 20
        Rectangle {
            id: redRectId
            width: 100; height: 100
            color: "red"
            radius: 20
            MouseArea {
                anchors.fill: parent // Use anchors to make the MouseArea fill the Rectangle
                onClicked: {
                    console.log("Clicked on the red rectangle")
                }
            }
        }
        Rectangle {
            id: greenRectId
            width: 100; height: 100
            color: "green"
            radius: 20
        }
        Rectangle {
            id: blueRectId
            width: 100; height: 100
            color: "blue"
            radius: 20
        }
        Rectangle {
            id: textRectId
            width: 100; height: 100
            color: "dodgerblue"
            radius: 100
            Text {
                id: textId
                anchors.centerIn: parent
                text: "hello"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on the dodgerblue circle")
                }
            }
        }
    }
}