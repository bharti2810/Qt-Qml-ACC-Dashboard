#include "dialog.h"
#include "acc.h"


dialog::dialog(QObject *parent) : QObject(parent)
{
    m_acc=new ACC(this);
    connect(m_acc,SIGNAL(ignitionStateChanged(bool)),this,SLOT(onIgnitionStateChanged(bool)));
    connect(m_acc,SIGNAL(engineTemperatureChanged(int)),this,SLOT(onEngineTemperatureChanged(int)));
    connect(m_acc,SIGNAL(fuelLevelChanged(int)),this,SLOT(onFuelLevelChanged(int)));
    connect(m_acc,SIGNAL(radarTimeChanged(int)),this,SLOT(onRadarTimeChanged(int)));
    connect(m_acc,SIGNAL(accStateChanged(bool)),this,SLOT(onAccStateChanged(bool)));
    connect(m_acc,SIGNAL(fractionOfThrottleOpeningChanged(float)),this,SLOT(onFractionOfThrottleOpeningChanged(float)));
}
void dialog::onIgnitionStateChanged(bool enginestate)
{
    qDebug() << "Engine State Updated: " << enginestate << "\n";
}
/////////////////////////////////////////////
void dialog::onEngineTemperatureChanged(int tempval)
{
    qDebug() << "Engine Temperature Updated: " << tempval << "\n";
}
////////////////////////////////////////////
void dialog::onFuelLevelChanged(int fuelval)
{
    qDebug() << "Fuel Level Updated: " << fuelval << "\n";
}
///////////////////////////////////////////
void dialog::onRadarTimeChanged(int radartimeval)
{
    qDebug() << "Distance Updated: " << radartimeval << "\n";
}
//////////////////////////////////////////
void dialog::onAccStateChanged(bool accstate)
{
    qDebug() << "ACC State Updated: " << accstate << "\n";
}
//////////////////////////////////////
void dialog::onFractionOfThrottleOpeningChanged(float throttlestate)
{
    qDebug() << "Throttle position Changed: " << throttlestate << "\n";
}
