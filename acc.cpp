#include "acc.h"

ACC::ACC(QObject *parent) : QObject(parent)
{
    timer=new QTimer(this);
    connect(timer,SIGNAL(timeout()),this,SLOT(onRpmChanged()));//+//commented for DBus
    connect(timer,SIGNAL(timeout()),this,SLOT(onSpeedChanged()));//+//commented for DBus
    timer->start(2000);//+//commented for DBus
}
bool ACC::ignitionState() const
{
    return m_ignitionState;
}
void ACC::setIgnitionState(bool value)
{
    m_ignitionState=value;
    emit ignitionStateChanged(m_ignitionState);
}
/////////////////////////////////////////////////
int ACC::engineTemperature() const
{
    return m_engineTemperature;
}
void ACC::setEngineTemperature(int value)
{
    m_engineTemperature=value;
    emit engineTemperatureChanged(m_engineTemperature);
}
////////////////////////////////////////////////
int ACC::fuelLevel() const
{
    return m_fuelLevel;
}
void ACC::setFuelLevel(int value)
{
    m_fuelLevel=value;
    emit fuelLevelChanged(m_fuelLevel);
}
////////////////////////////////////////////////
int ACC::radarTime() const
{
    return m_radarTime;
}
void ACC::setRadarTime(int value)
{
    m_radarTime=value;
    emit radarTimeChanged(m_radarTime);
}
///////////////////////////////////////////////
bool ACC::accState() const
{
    return m_ACCState;
}
void ACC::setAccState(bool value)
{
    m_ACCState=value;
    emit accStateChanged(m_ACCState);
}
//////////////////////////////////////////////
float ACC::fractionOfThrottleOpening() const
{
    return m_fractionOfThrottleOpening;
}
void ACC::setFractionOfThrottleOpening(float value)
{
    m_fractionOfThrottleOpening=value;
    emit fractionOfThrottleOpeningChanged(m_fractionOfThrottleOpening);
}
///////////////////////////////////////////////
/*float ACC::getRpm()
{
   // m_rpm= THROTTLE_MAX *fractionOfThrottleOpening();
   // m_rpm/=10;
   m_rpm= (m_speed*60)/circumference;
   m_rpm=m_rpm/100;
    return m_rpm;
}*/


float ACC::getDistance()
{
    distance = (radarTime()*velocity_of_sound);
            distance/=2;
    qDebug() << "distance"<<distance ;
    return distance;
}

float ACC::getSpeed()
{
    m_speed=getDistance()*radarTime();
    return m_speed;
}
void ACC::onSpeedChanged() {

     qDebug() << "speed=" << getSpeed() ;
    emit speedChanged(QVariant(getSpeed()));//+

}
void ACC::onRpmChanged()
{   m_rpm= (getSpeed()*12)/circumference;
    m_rpm=m_rpm/1000;

    emit rpmChanged(QVariant(m_rpm));//+
}
