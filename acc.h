#ifndef ACC_H
#define ACC_H

#include <QObject>
#include <QDebug>
#include<QTimer>


class ACC : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool ignitionState READ ignitionState WRITE setIgnitionState NOTIFY ignitionStateChanged)
    Q_PROPERTY(int engineTemperature READ engineTemperature WRITE setEngineTemperature NOTIFY engineTemperatureChanged)
    Q_PROPERTY(int fuelLevel READ fuelLevel WRITE setFuelLevel NOTIFY fuelLevelChanged)
    Q_PROPERTY(int radarTime READ radarTime WRITE setRadarTime NOTIFY radarTimeChanged)
    Q_PROPERTY(bool accState READ accState WRITE setAccState NOTIFY accStateChanged)
    Q_PROPERTY(bool breakSwitch1State READ breakSwitch1State WRITE setBreakSwitch1State NOTIFY breakSwitch1Changed)
    Q_PROPERTY(bool breakSwitch2State READ breakSwitch2State WRITE setBreakSwitch2State NOTIFY breakSwitch2Changed)

public:
    explicit ACC(QObject *parent = nullptr);
    bool ignitionState() const;
    void setIgnitionState(bool);
    int engineTemperature() const;
    void setEngineTemperature(int);
    int fuelLevel() const;
    void setFuelLevel(int);
    int radarTime() const;
    void setRadarTime(int);
    bool accState() const;
    void setAccState(bool);

    float getRpm();
    bool breakSwitch1State() const;
    void  setBreakSwitch1State(bool);
    bool breakSwitch2State() const;
    void  setBreakSwitch2State(bool);



signals:
    void ignitionStateChanged(bool);
    void engineTemperatureChanged(int);
    void fuelLevelChanged(int);
    void radarTimeChanged(int);
    void accStateChanged(bool);
    void breakSwitch1Changed(bool);
    void breakSwitch2Changed(bool);
    void rpmChanged(QVariant);
    void speedChanged(QVariant);


public slots:
    void onRpmChanged();
    void onSpeedChanged();

private:
    bool m_ignitionState;
    int m_engineTemperature;
    int m_fuelLevel;
    int m_radarTime;
    bool m_ACCState;
    bool m_breakSwitch1State;
    bool m_breakSwitch2State;
    float m_fractionOfThrottleOpening;
    float m_rpm;
   // float THROTTLE_MAX=80;
    float velocity_of_sound=0.277777778;
    float circumference = 0.2096;
    QTimer *timer;//++
    float m_speed;
    int distance;
    float getSpeed();
};

#endif // ACC_H
