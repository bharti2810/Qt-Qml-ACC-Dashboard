import QtQuick 2.1


Item{
Rectangle {
    //property string bgcolor;
    //property string caption;
    id:root
    property  alias bgcolor:root.color
    property alias caption: buttonText.text
    width: 100
    height: 30
    border.width: 4
    border.color: "white"
    //color: bgcolor
    radius: 10
    Text
    {
        id:buttonText
        anchors.centerIn: parent
        font.bold: true
        font.pixelSize: 20
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("button clicked:"+caption)
          }
     }
}
}
