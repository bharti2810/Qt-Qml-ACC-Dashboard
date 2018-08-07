#ifndef DIALOG_H
#define DIALOG_H

#include <QObject>
#include "acc.h"
#include <QDBusConnection>
#define SERVICE_NAME "org.examples.ivi.dashboard"

class dialog : public QObject
{
    Q_OBJECT
public:
    explicit dialog(QObject *parent = nullptr);

signals:

public slots:
    void onIgnitionStateChanged(bool);
    void onEngineTemperatureChanged(int);
    void onFuelLevelChanged(int);
    void onRadarTimeChanged(int);
    void onAccStateChanged(bool);
    void onBreakSwitch1Changed(bool);
    void onBreakSwitch2Changed(bool);

private:
     ACC *m_acc;
};

#endif // DIALOG_H
