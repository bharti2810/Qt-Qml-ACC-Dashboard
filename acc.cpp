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
float ACC::getRpm()
{
    m_rpm= THROTTLE_MAX *fractionOfThrottleOpening();
    m_rpm/=10;
    return m_rpm;
}

void ACC::onRpmChanged()
{
    qDebug() << fractionOfThrottleOpening() ;
    emit rpmChanged(QVariant(getRpm()));//+
}
void ACC::onSpeedChanged() {

    distance = radarTime()*velocity_of_sound;
    qDebug() << "distance"<<distance ;
    m_speed=getRpm()*circumference;
    m_speed/= 12;
    qDebug() << "speed=" << m_speed ;
    emit speedChanged(QVariant(m_speed));//+

}
