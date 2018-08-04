import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2//added for Slider
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Extras.Private 1.0

Window {
    visible: true
    width: 3080
    height: 2400
    title: qsTr("Hello World")


    Rectangle {
        width:700
        height:200
        color:"black"
        anchors.centerIn: parent
    }
    Rectangle {
        width:280
        height:280
        radius:140
        color:"black"
        border.color: "#FF9A00"
        border.width:3
        x:220
        y:225
        //padding:50
        CircularGauge {
            x:4
            y:4
            id:speedoMeter
            //value: slider.value*140
            maximumValue:220
            style: CircularGaugeStyle {
                tickmarkStepSize : 20
                /*  id: style

                function degreesToRadians(degrees) {
                    return degrees * (Math.PI / 180);
                }

                background: Canvas {
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.reset();

                        ctx.beginPath();
                        ctx.strokeStyle = "#e34c22";
                        ctx.lineWidth = outerRadius * 0.02;

                        ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                                degreesToRadians(valueToAngle(80) - 90), degreesToRadians(valueToAngle(100) - 90));
                        ctx.stroke();
                    }
                }*/

                tickmark: Rectangle {

                    visible: styleData.value < 160 || styleData.value % 10 == 0
                    implicitWidth: outerRadius * 0.02
                    antialiasing: true
                    implicitHeight: outerRadius * 0.06
                    color: styleData.value >= 160 ? "#FF9A00" : "#e5e5e5"
                    Text{
                        font.pixelSize:40

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.bottom
                            text:Math.round(styleData.index*10)
                            font.pixelSize: 12
                            color: "lightblue"
                        }
                    }
                }
                minorTickmark: Rectangle {
                    visible: styleData.value < 160
                    implicitWidth: outerRadius * 0.01
                    antialiasing: true
                    implicitHeight: outerRadius * 0.03
                    color: "#e5e5e5"
                }
                tickmarkLabel:  Text {
                    font.pixelSize: 13
                    text: styleData.value
                    color: styleData.value >= 160 ? "#e34c22" : "#e5e5e5"
                    antialiasing: true
                }

                needle: Rectangle {
                    y: outerRadius * 0.15
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    // color: Qt.rgba(0.66, 0.3, 0, 1)
                    gradient: Gradient
                    {
                        GradientStop
                        {
                            position: 0.00
                            color: "#FF9A00"
                        }   // GradientStop

                        GradientStop
                        {
                            position: 0.80
                            color: "#FF4D00"
                        }   // GradientStop
                    }

                }//needle

                foreground:  Item{
                    Rectangle
                    {
                        width: outerRadius*0.2
                        height: width

                        radius: width/2

                        anchors.centerIn: parent

                        gradient: Gradient
                        {
                            GradientStop
                            {
                                position: 0.00
                                color: "steelblue"
                            }

                            GradientStop
                            {
                                position: 0.70
                                color: "#191919"
                            }   // GradientStop
                        }   // gradient
                    }   // foreground

                }//item


            }//style
            Text {
                id: indexText
                text: "MPH"
                y:195
                x:105
                // anchors.horizontalCenter: parent.horizontalCenter
                //anchors.bottom: valueText.top
                color: "lightblue"
            }
            Text {
                id: valueText
                text: "km/hr"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                color:"#e5e5e5"

            }


        }//gauge


    }//rectangle1
    Rectangle {
        x:780
        y:225
        width:280
        height:280
        radius:140
        border.color: "#FF9A00"
        border.width:3
        color:"black"
        CircularGauge {
            x:4
            y:4
            id:tachoMeter
            //value: slider.value*8
            maximumValue:8
            style: CircularGaugeStyle {
                tickmarkStepSize : 1//default tick mark size is 10

                //:Qt.rgba(1, 1, 1, 1)
                needle: Rectangle {

                    y: outerRadius * 0.15
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    color: Qt.rgba(0.66, 0.3, 0, 1)

                }
            }
        }

    }

    //rectangle for fuel indicator
    Rectangle {
        x:500
        y:175
        border.color: "#FF9A00"
        border.width:3
        width:140
        height:140
        radius:70
        color:"black"
        CircularGauge {

            width:135
            height:135
            x:4
            y:4
            id:tempIndicator
            //value: slider.value*8
            maximumValue:120
            minimumValue:60


            style: CircularGaugeStyle {
                minimumValueAngle :-60
                maximumValueAngle: 60
                tickmarkStepSize : 30//default tick mark size is 10

                //:Qt.rgba(1, 1, 1, 1)
                needle: Rectangle {
                    y: outerRadius * 0.15
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    color: Qt.rgba(0.66, 0.3, 0, 1)

                }
            }
        }

    }
    Rectangle {
        x:650
        y:175
        border.color: "#FF9A00"
        border.width:3
        width:140
        height:140
        radius:70
        color:"black"
        CircularGauge {

            width:135
            height:135
            x:4
            y:4
            id:fuelIndicator
            //value: slider.value*8
            maximumValue:1
            minimumValue:0
            Indicator
            {
                id:fuel
                //x:20
                //y:20
                mySource1:"index.png"//full
                mySource2:"images.png"//empty
                fuelstatus:0
               // anchors.fill:parent
            }

            style: CircularGaugeStyle {
                minimumValueAngle :-60
                maximumValueAngle: 60
                tickmarkStepSize : 0.5//default tick mark size is 10

                //:Qt.rgba(1, 1, 1, 1)
                needle: Rectangle {
                    y: outerRadius * 0.15
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    color: Qt.rgba(0.66, 0.3, 0, 1)



                }
            }
        }
    }


        /*Timer{
            id:timer
            running:true
            repeat:true
            interval:1000
            onTriggered:
            {
                if(1)
                    Indicator.target="image2"

                else
                    Indicator.target="image2"
            }
        }*/


    /* states: State {
        name: "mouse-over"; when: mouseArea.containsMouse
        PropertyChanges { target: rect; scale: 0.8; opacity: 0}
        PropertyChanges { target: rect2; scale: 0.8; opacity: 1}
    }
    states: "go"

        State{
            name:"go"
            PropertyChanges{target:fuel;state:"image1"}
           // PropertyChanges{target:rlight;state:"off"}
            //PropertyChanges{target:ylight;state:"off"}
        }*/

}



