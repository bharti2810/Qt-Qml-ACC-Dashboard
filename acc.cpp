#include "acc.h"

ACC::ACC(QObject *parent) : QObject(parent)
{

}
bool ACC::ignitionState()// const
{
    return m_ignitionState;
}
void ACC::setIgnitionState(bool value)
{
    m_ignitionState=value;
    emit ignitionStateChanged(m_ignitionState);
}
/////////////////////////////////////////////////
int ACC::engineTemperature() //const
{
    return m_engineTemperature;
}
void ACC::setEngineTemperature(int value)
{
    m_engineTemperature=value;
    emit engineTemperatureChanged(m_engineTemperature);
}
////////////////////////////////////////////////
int ACC::fuelLevel() //const
{
    return m_fuelLevel;
}
void ACC::setFuelLevel(int value)
{
    m_fuelLevel=value;
    emit fuelLevelChanged(m_fuelLevel);
}
////////////////////////////////////////////////
int ACC::distance() //const
{
    return m_distance;
}
void ACC::setDistance(int value)
{
    m_distance=value;
    emit distanceChanged(m_distance);
}
///////////////////////////////////////////////
bool ACC::accState() //const
{
    return m_ACCState;
}
void ACC::setAccState(bool value)
{
    m_ACCState=value;
    emit accStateChanged(m_ACCState);
}
//////////////////////////////////////////////
