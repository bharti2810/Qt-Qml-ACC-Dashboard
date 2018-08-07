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
    connect(m_acc,SIGNAL(breakSwitch1Changed(bool)),this,SLOT(onBreakSwitch1Changed(bool)));
    connect(m_acc,SIGNAL(breakSwitch2Changed(bool)),this,SLOT(onBreakSwitch2Changed(bool)));
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
//////////////////////////////////////////
void dialog::onBreakSwitch1Changed(bool breakSwitch1)
{
    qDebug() << "Brake 1 State changed: " << breakSwitch1 << "\n";
}
///////////////////////////////////////
void dialog::onBreakSwitch2Changed(bool breakSwitch2)
{
    qDebug() << "Brake 2 State changed: " << breakSwitch2 << "\n";
}
