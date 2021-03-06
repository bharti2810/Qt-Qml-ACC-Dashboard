#include "acc.h"

ACC::ACC(QObject *parent) : QObject(parent)
{
    timer=new QTimer(this);
    connect(timer,SIGNAL(timeout()),this,SLOT(onRpmChanged()));//+//commented for DBus
    connect(timer,SIGNAL(timeout()),this,SLOT(onSpeedChanged()));//+//commented for DBus
    connect(timer,SIGNAL(timeout()),this,SLOT(onDistanceChanged()));//+//commented for DBus
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
/////////////////////////////////////////////
bool ACC::breakSwitch1State() const
{
    return m_breakSwitch1State;
}
void ACC::setBreakSwitch1State(bool value)
{
    m_breakSwitch1State=value;
    emit breakSwitch1Changed(m_breakSwitch1State);
}
///////////////////////////////////////////////
bool ACC::breakSwitch2State() const
{
    return m_breakSwitch2State;
}
void ACC::setBreakSwitch2State(bool value)
{
    m_breakSwitch2State=value;
    emit breakSwitch2Changed(m_breakSwitch2State);
}
//////////////////////////////////////////////
float ACC::getDistance()
{
    m_distance = (radarTime()*velocity_of_sound);
    m_distance/=2;
    qDebug() << "distance/"<<m_distance ;
    return m_distance;
}
void ACC::onDistanceChanged()
{
    qDebug() << "distance=" << getDistance() ;
    emit distanceChanged(QVariant(m_distance));//+
}
///////////////////////////////////////////////
float ACC::getSpeed()
{
    m_speed=getDistance()*radarTime();
    return m_speed;
}
void ACC::onSpeedChanged()
{
    qDebug() << "speed=" << getSpeed() ;
    emit speedChanged(QVariant(getSpeed()));//+
}
//////////////////////////////////////////////
void ACC::onRpmChanged()
{
    m_rpm= (getSpeed()*12)/circumference;
    m_rpm=m_rpm/1000;
    emit rpmChanged(QVariant(m_rpm));//+
}
