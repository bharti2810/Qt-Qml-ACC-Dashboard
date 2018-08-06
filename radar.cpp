/*#include "radar.h"




//Radar Radar::THROTTLE_MAX(80);
Radar::Radar(QObject *parent) : QObject(parent)
{   timer=new QTimer(this);
    connect(timer,SIGNAL(timeout()),this,SLOT(onRpmChanged()));//+//commented for DBus
    timer->start(2000);//+//commented for DBus

}


void Radar::onRpmChanged()
{ // a.radarTime(30);
   m_rpm= THROTTLE_MAX *2;
    //qDebug() << a.radarTime() ;
    emit rpmChanged(QVariant(m_rpm));//+
}


*/
