

import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2//added for Slider
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Extras.Private 1.0


Window {
    id: window
    width:1100
    height:700
    visible: true
    color: "#d3d7cf"
    property alias indexText: indexText
    title: qsTr("Hello World")

    /////////////////////////////////////////////////////////////////////////
    Rectangle {
        id: rectangle2
        x:300
        y:250
        width:window.width*0.4
        height:200
        color:"black"
       // anchors.centerIn: parent
        Indicator {
            id: lindicator
            x: 95
            y: 2
            mySource1: "left.jpg"
            mySource2: "leftwhite.jpg"
            scaleIndicatorOn:0.8
            scaleIndicatorOff:0.8
            istatus: true
        }

        Indicator {
            id: rindicator
            x: 365
            y: 2
            mySource1: "right.jpg"
            mySource2: "rightwhite.jpg"
            scaleIndicatorOn:0.8
            scaleIndicatorOff:0.9
            istatus: true
        }

    }
    ///////////////////////////////////////////////////////////////////////
    Rectangle {
        id: rectangle1
        width: 280
        height:280
        radius:140
        color:"black"

        border.color: "#FF9A00"
        border.width:3
        x:143
        y:215

        CircularGauge {
            width: 272

            anchors.top: parent.top
            anchors.topMargin: 4
            anchors.left: parent.left
            anchors.leftMargin: 4
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 4
            id:speedoMeter
            //value: slider.value*140
            maximumValue:220
            style: CircularGaugeStyle {
                tickmarkStepSize : 20
                /*id: style

                function degreesToRadians(degrees) {
                    return degrees * (Math.PI / 180);
                }

               Canvas {
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
                    color: styleData.value >= 160 ? "#FF9A00" : "#e5e5e5"
                    antialiasing: true
                }

                needle: Rectangle {
                    y: outerRadius * 0.2
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
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
                            }
                        }   // gradient
                    }   // foreground

                }//item


            }//style
            Text {
                id: indexText
                text: "MPH"
                x:140
                y:215
                color: "lightblue"
            }
            Text {
                font.pixelSize: 12
                id: valueText
                x:75
                y:240
                text: "Km/hr"
                //anchors.horizontalCenter: parent.horizontalCenter
                //anchors.bottom: parent.bottom
                color:"#e5e5e5"

            }
            Indicator {
                id: ignition
                x: 70
                y: 60
                width: 8
                height: 0
                mySource1: "Ignition.jpg"
                mySource2: "Ignitionwhite.jpg"
                scaleIndicatorOn:0.4
                scaleIndicatorOff:0.4
                istatus: false
            }
            Indicator {
                id: brake
                x: 80
                y: 15
                width: 8
                height: 0
                mySource1: "Brake.jpg"
                mySource2: "Brakewhite.jpg"
                scaleIndicatorOn:0.17
                scaleIndicatorOff:0.17
                istatus: false
            }
            Indicator {
                id: cruise
                x: 110
                y: 70
                width: 8
                height: 0
                mySource1: "CruiseOn.jpg"
                mySource2: "CruiseOnwhite.jpg"
                scaleIndicatorOn:0.23
                scaleIndicatorOff:0.23
                istatus: false
            }
            Indicator {
                id: abs
                x: 75
                y: 100
                mySource1: "Speedlimiterwarn.jpg"
                mySource2: "Speedlimiterwarnwhite.jpg"
                scaleIndicatorOn:0.23
                scaleIndicatorOff:0.23
                istatus: false
            }


        }//gauge
    }//rectangle speedometer
    ////////////////////////////////////////////////////////////////////////
    Rectangle {
        x:676
        y:210
        width:280
        height:280
        radius:140
        border.color: "#FF9A00"
        border.width:3
        color:"black"
        CircularGauge {
            x:6
            y:3
            id:tachoMeter
            //value: slider.value*8
            maximumValue:8
            style: CircularGaugeStyle {
                tickmarkStepSize : 1//default tick mark size is 10

                tickmarkLabel:  Text {
                    font.pixelSize: 15
                    text: styleData.value
                    color: styleData.value >= 7 ? "#FF9A00" : "#e5e5e5"
                    antialiasing: true
                }
                needle: Rectangle {

                    y: outerRadius * 0.2
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    //color: Qt.rgba(0.66, 0.3, 0, 1)
                    gradient: Gradient
                    {
                        GradientStop
                        {
                            position: 0.00
                            color: "#FF9A00"
                        }

                        GradientStop
                        {
                            position: 0.80
                            color: "#FF4D00"
                        }
                    }

                }//needle tacho

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
                            }
                        }   // gradient
                    }   // foreground tacho

                }//item

            }
            Text {
                font.pixelSize: 12
                id: valuerpmText
                x:70
                y:240
                text: "rpm x1000"
                color:"#e5e5e5"

            }

            Indicator {
                id: headlight
                x: 30
                y: 60
                mySource1: "Headlight.jpg"
                mySource2: "DippedHeadlight.jpg"
                scaleIndicatorOn:0.4
                scaleIndicatorOff:0.4
                istatus: true
            }


            Indicator {
                id: mil
                x: 10
                y: 100
                mySource1: "MIL.jpg"
                mySource2: "Milwhite.jpg"
                scaleIndicatorOn:0.25
                scaleIndicatorOff:0.25
                istatus: false
            }

            Indicator {
                id: oil
                x: 120
                y: 60
                mySource1: "Oil.jpg"
                mySource2: "Oilwhite.jpg"
                scaleIndicatorOn:0.25
                scaleIndicatorOff:0.25
                istatus: false
            }

            Indicator {
                id: seatbelt
                x: 65
                y: 10
                mySource1: "seatbelt.jpg"
                mySource2: "seatbeltwhite.jpg"
                scaleIndicatorOn:0.25
                scaleIndicatorOff:0.25
                istatus: false
            }
            Indicator {
                id: hazard
                x: 120
                y: 25
                mySource1: "hazard.jpg"
                mySource2: "hazardwhite.jpg"
                scaleIndicatorOn:0.33
                scaleIndicatorOff:0.33
                istatus: false
            }

        }
    }    //rectangle for tachometer

    /////////////////////////////////////////////////////////////////////////////
    Rectangle {
        x:424
        y:175
        border.color: "#FF9A00"
        border.width:3
        width:120
        height:120
        radius:60
        color:"black"
        CircularGauge {

            width:110
            height:110
            value: 70
            x:5
            y:6
            id:tempIndicator
            //value: slider.value*8
            maximumValue:120
            minimumValue:60


            style: CircularGaugeStyle {
                minimumValueAngle :-60
                maximumValueAngle: 60
                tickmarkStepSize : 30//default tick mark size is 10
                tickmarkLabel: Text {
                    font.pixelSize: 12
                    text: styleData.value
                    color: styleData.value >= 100 ? "#FF9A00" : "#e5e5e5"
                    antialiasing: true
                }
                tickmark: Rectangle {

                    visible: styleData.value < 120 || styleData.value % 10 == 0
                    implicitWidth: outerRadius * 0.03
                    antialiasing: true
                    implicitHeight: outerRadius * 0.09
                    color: styleData.value >= 90 ? "#FF9A00" : "#e5e5e5"
                    Text{
                        font.pixelSize: 70

                    }
                }
                minorTickmark: Rectangle {
                    visible: styleData.value < 120
                    implicitWidth: outerRadius * 0.01
                    antialiasing: true
                    implicitHeight: outerRadius * 0.06
                    color: "#e5e5e5"
                }

                needle: Rectangle {
                    y: outerRadius * 0.25
                    implicitWidth: outerRadius * 0.06
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    //color: Qt.rgba(0.66, 0.3, 0, 1)
                    gradient: Gradient
                    {
                        GradientStop
                        {
                            position: 0.00
                            color: "#FF9A00"
                        }

                        GradientStop
                        {
                            position: 0.80
                            color: "#FF4D00"
                        }
                    }

                }//needle temp
                foreground:  Item{
                    Rectangle
                    {
                        width: outerRadius*0.4
                        height: width
                        radius: width/2
                        anchors.centerIn: parent
                        gradient: Gradient
                        {
                            GradientStop
                            {   position: 0.00
                                color: "steelblue"
                            }

                            GradientStop
                            {
                                position: 0.70
                                color: "#191919"
                            }
                        }
                    }
                }
            }
            Indicator {
                id: temp
                x: -18
                y: 22
                width: 8
                height: 0
                mySource1: "temp.jpg"
                mySource2: "tempwhite.jpg"
                scaleIndicatorOn:0.28
                scaleIndicatorOff:0.28
                istatus: true
            }
            Indicator {
                id: celsius
                x: 35
                y: 27
                mySource1: "celsiuswhite.jpg"
                mySource2: "celsiuswhite.jpg"
                scaleIndicatorOn:0.23
                scaleIndicatorOff:0.23

            }
        }


    } //rectangle for temp indicator
    Rectangle {
        id: rectangle
        x:550
        y:175
        border.color: "#FF9A00"
        border.width:3
        width:120
        height:120
        radius:60
        color:"black"
        CircularGauge {

            width:110
            height:115
            value: 0.5
            x:5
            y:5
            id:fuelIndicator
            maximumValue:1
            minimumValue:0

            style: CircularGaugeStyle {
                minimumValueAngle :-60
                maximumValueAngle: 60
                tickmarkStepSize : 0.5
                tickmarkLabel:  Text {
                    font.pixelSize: 13
                    text: styleData.value
                    color: styleData.value <= 0 ? "#FF9A00" : "#e5e5e5"
                    antialiasing: true
                }
                tickmark: Rectangle {

                    visible: styleData.value <=1 || styleData.value % 10 == 0
                    implicitWidth: outerRadius * 0.03
                    antialiasing: true
                    implicitHeight: outerRadius * 0.09
                    color: styleData.value <= 0 ? "#FF9A00" : "#e5e5e5"
                    Text{
                        font.pixelSize: 70

                    }
                }
                minorTickmark: Rectangle {
                    visible: styleData.value < 1
                    implicitWidth: outerRadius * 0.01
                    antialiasing: true
                    implicitHeight: outerRadius * 0.06
                    color: "#e5e5e5"
                }
                needle: Rectangle {
                    y: outerRadius * 0.25
                    implicitWidth: outerRadius * 0.06
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    gradient: Gradient
                    {
                        GradientStop
                        {
                            position: 0.00
                            color: "#FF9A00"
                        }

                        GradientStop
                        {
                            position: 0.80
                            color: "#FF4D00"
                        }
                    }

                }//needle fuel

                foreground:  Item{
                    Rectangle
                    {
                        width: outerRadius*0.4
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
                            }
                        }   // gradient
                    }
                }
            }

            Indicator {
                id: fuel
                x: 40
                y: 20
                width: 8
                height: 0
                mySource1: "fuel.jpg"
                mySource2: "fuelwhite.jpg"
                scaleIndicatorOn:0.25
                scaleIndicatorOff:0.2
                istatus: true
            }
        }
    }//rectangle for fuel indicator



}

