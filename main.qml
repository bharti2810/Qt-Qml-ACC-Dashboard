import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2//added for Slider
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.0
import QtQuick.Extras.Private 1.0
import QtGraphicalEffects 1.0
import QtMultimedia 5.8


Window {
    id: window
    width:1100
    height:700
    visible: true
    color: "#d3d7cf"
    title: qsTr("Hello World")
    property int speed
    property int chngspeed
    Image {
        width:1400
        height:1000
          source: "background.jpg"

       }

    Text{
        id:speedValue
        x:522
        y:270
        width: 150
        font.pixelSize: 28
        color:"white"
        z: 1
        visible: (ACC.ignitionState) ? true : false
    }
    Text {
        id:km
        x:532
        y:298
        text: "km/hr"
        z: 2
        font.pixelSize: 13
        color:"white"
        visible: (ACC.ignitionState) ? true : false
    }
    Rectangle {
        id: rectangle2
        x:300
        y:250
        width:window.width*0.4
        height:200
        color:"black"

        Image{
            id:carlane
            x: 144
            y: 0
            height:200
            visible: (ACC.ignitionState) ? true : false
            width:243
            source:"carLane.png"
           /* Timer {
                    interval: 500; running: true; repeat: true
                    onTriggered: carlane.rotation = Date().toString()
                }*/


        }
        Image{
            id: image1
            x: 206
            y: 60
            width: 81
            scale:0.32
            source:"trap1.png"

        }
        Image{
            id: image2
            x: 200
            y: 70
            width: 93
            height: 16
            scale:0.32
            source:"trap2.png"
        }
        Image{
            id: image3
            x: 188
            y: 80
            width: 118
            height: 20
            scale:0.32
            source:"trap3.png"
        }
        Image{
            id: image4
            x: 176
            y: 92
            width: 142
            height: 21
            scale:0.32
            source:"trap3.png"
        }
        Image{
            id: image5
            x: 164
            y: 105
            width: 167
            height: 22
            scale:0.32
            source:"trap3.png"
        }
        Image{
            x: 124
            y: 28
            width: 81
            height: 80
            visible: true
            scale:0.5
            source:"screen1.png"
        }
        Image{
            x: 298
            y: 29
            width: 79
            height: 79
            visible: true
            scale:0.5
            source:"screen2.png"
            rotation:steeringwheel.rotation
        }

        Indicator {
            id: lindicator
            x: 95
            y: 2
            mySource1: "left.jpg"
            mySource2: "leftwhite.jpg"
            scaleIndicatorOn:0.8
            scaleIndicatorOff:0.8
        }

        Indicator {
            id: rindicator
            x: 365
            y: 2
            mySource1: "right.jpg"
            mySource2: "rightwhite.jpg"
            scaleIndicatorOn:0.8
            scaleIndicatorOff:0.9
        }
        focus:true
        Keys.onLeftPressed:
        {
            lindicator.istatus = 1;
            steeringwheel.rotation=-30
        }
        Keys.onRightPressed:
        {
            rindicator.istatus = 1;
            steeringwheel.rotation=+30
        }

        Keys.onReleased:
        {steeringwheel.rotation=0
            lindicator.istatus = 0;
            rindicator.istatus = 0;
        }
    }

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
            id:speedoMeter
            anchors.top: parent.top
            anchors.topMargin: 4
            anchors.left: parent.left
            anchors.leftMargin: 4
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 4

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
                z: -1
                mySource1: "Ignition.jpg"
                mySource2: "Ignitionwhite.jpg"
                scaleIndicatorOn:0.4
                scaleIndicatorOff:0.4
                istatus: ACC.ignitionState
            }
            Indicator {
                id: brake
                x: 75
                y: 13
                width: 8
                height: 0
                z: -2
                mySource1: "Brake.jpg"
                mySource2: "Brakewhite.jpg"
                scaleIndicatorOn:0.17
                scaleIndicatorOff:0.17
                istatus: 0
            }
            Indicator {
                id: cruise
                x: 110
                y: 70
                width: 8
                height: 0
                z: -3
                mySource1: "CruiseOn.jpg"
                mySource2: "CruiseOnwhite.jpg"
                scaleIndicatorOn:0.23
                scaleIndicatorOff:0.23
                // istatus: ACC.accState
            }
            Indicator {
                id: abs
                x: 75
                y: 100
                z: -4
                mySource1: "Speedlimiterwarn.jpg"
                mySource2: "Speedlimiterwarnwhite.jpg"
                scaleIndicatorOn:0.23
                scaleIndicatorOff:0.23

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
            maximumValue:10
            style: CircularGaugeStyle {
                tickmarkStepSize : 1//default tick mark size is 10

                tickmark: Rectangle {

                    visible: styleData.value < 10 || styleData.value % 10 == 0
                    implicitWidth: outerRadius * 0.02
                    antialiasing: true
                    implicitHeight: outerRadius * 0.06
                    color: styleData.value >= 7 ? "#FF9A00" : "#e5e5e5"
                }
                minorTickmark: Rectangle {
                    visible: styleData.value < 7
                    implicitWidth: outerRadius * 0.01
                    antialiasing: true
                    implicitHeight: outerRadius * 0.03
                    color: "#e5e5e5"
                }

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
                z: -1
                mySource1: "Headlight.jpg"
                mySource2: "DippedHeadlight.jpg"
                scaleIndicatorOn:0.4
                scaleIndicatorOff:0.4
                istatus: 1
            }


            Indicator {
                id: mil
                x: 10
                y: 100
                z: -2
                mySource1: "MIL.jpg"
                mySource2: "Milwhite.jpg"
                scaleIndicatorOn:0.25
                scaleIndicatorOff:0.25
                istatus: 1
            }

            Indicator {
                id: oil
                x: 120
                y: 60
                z: -3
                mySource1: "Oil.jpg"
                mySource2: "Oilwhite.jpg"
                scaleIndicatorOn:0.25
                scaleIndicatorOff:0.25
                istatus: 1
            }

            Indicator {
                id: seatbelt
                x: 65
                y: 10
                z: -4
                mySource1: "seatbelt.jpg"
                mySource2: "seatbeltwhite.jpg"
                scaleIndicatorOn:0.25
                scaleIndicatorOff:0.25
                istatus: 1
            }
            Indicator {
                id: hazard
                x: 120
                y: 25
                z: -5
                mySource1: "hazard.jpg"
                mySource2: "hazardwhite.jpg"
                scaleIndicatorOn:0.33
                scaleIndicatorOff:0.33
                istatus: 1
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
            id:tempIndicator
            width:110
            height:110
            value: (ACC.ignitionState) ? ACC.engineTemperature : 0
            x:5
            y:6

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
                z: -1
                mySource1: "temp.jpg"
                mySource2: "tempwhite.jpg"
                scaleIndicatorOn:0.28
                scaleIndicatorOff:0.28
                istatus: (ACC.engineTemperature > 90) ? 1 : 0
            }
            Indicator {
                id: celsius
                x: 35
                y: 27
                z: -2
                mySource1: "celsiuswhite.jpg"
                mySource2: "celsiuswhite.jpg"
                scaleIndicatorOn:0.23
                scaleIndicatorOff:0.23

            }
        }

    } //rectangle for temp indicator
    Rectangle {
        /*MouseArea {
               anchors.fill: parent
               onClicked: console.log( (ACC.ignitionState) ?  "IgnitionOn":  "IgnitionOff")
           }*/
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
            id:fuelIndicator
            width:110
            height:115
            value: (ACC.ignitionState) ? ACC.fuelLevel : 0
            x:5
            y:5

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
                z: -1
                mySource1: "fuel.jpg"
                mySource2: "fuelwhite.jpg"
                scaleIndicatorOn:0.25
                scaleIndicatorOff:0.2
                istatus: !(ACC.fuelLevel)
            }
        }
    }//rectangle for fuel indicator


    Image {
        width: 10
        height: 10
        x:545
        y:556
        id: steeringwheel
        source: "steerinwheel.png"
        scale: 25
    }
    Image {
        id: acc
        x: 504
        y: 536
        source: "accbutton.jpg"
        scale:0.4
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if( ACC.accState)
                {
                    ACC.accState=0;
                }
                else
                    ACC.accState=1;
            }
        }
    }
    Image {
        id: setp
        x: 479
        y: 512
        width: 128
        height: 65
        source: "set+.jpg"
        scale:0.2
        MouseArea {
            anchors.fill: parent
            onClicked: {
                chngspeed=++speed;
                console.log("speed by set"+chngspeed)
            }
        }

    }
    Image {
        id: setm
        x: 479
        y: 557
        MouseArea {
            anchors.fill: parent
            onClicked: {
                chngspeed=--speed;
                console.log("speed by set"+chngspeed)
            }

        }

        width: 128
        height: 65
        source: "set-.jpg"
        scale:0.2
    }
    Image {
        id: res
        x: 522
        y: 539
        width: 104
        height: 53
        source: "res.jpg"
        scale:0.3
    }
    Image {
        id: cancel
        x: 460
        y: 540
        sourceSize.width: 0
        sourceSize.height: -6
        fillMode: Image.Stretch
        source: "canc.jpg"
        scale:0.3
    }

    function updateRpm(val)//+//cpp to qml
    {
        console.log("Rpm changed:"+val);//++
        if(ACC.ignitionState)
        {
            tachoMeter.value=val//to get values without slider
        }
        else
        {
            tachoMeter.value=0
        }
    }


    function updateSpeed(val)//+//cpp to qml
    { if(chngspeed)
            speedValue.text=chngspeed
        else
            speedValue.text=speed
        console.log("Speed changed:"+val);//++

        if(ACC.ignitionState)
        {
            speedoMeter.value=val//to get values without slider
            if (val<160)
            {
                abs.istatus=0
            }
            else
            {
                abs.istatus=1
            }

        }
        else
        {
            speedoMeter.value=0
        }
        if(ACC.breakSwitch1State)
        { if( ACC.breakSwitch2State)
            { if(ACC.onSpeedChanged() <25)
                {cruise.istatus=0
                    console.log("status"+cruise.istatus)
                }


            }
        }
        else{
            cruise.istatus=ACC.accState
        }
        speed=val;

        /* setp.mouseClicked: {
                        increase();
                    }*/


    }


    function updateDistance(val)
    {
        console.log("Distance changed:"+val);//++
        if(ACC.ignitionState)
        {
            if(val<3)
            {image1.visible=false
                image2.visible=false
            }
            else
            {image1.visible=true
                image2.visible=true
            }
        }
        else
        {
            image1.visible=false
            image2.visible=false
            image3.visible=false
            image4.visible=false
            image5.visible=false
        }
    }
}


