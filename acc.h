#ifndef ACC_H
#define ACC_H

#include <QObject>
#include <QDebug>


class ACC : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool ignitionState READ ignitionState WRITE setIgnitionState NOTIFY ignitionStateChanged)
    Q_PROPERTY(int engineTemperature READ engineTemperature WRITE setEngineTemperature NOTIFY engineTemperatureChanged)
    Q_PROPERTY(int fuelLevel READ fuelLevel WRITE setFuelLevel NOTIFY fuelLevelChanged)
    Q_PROPERTY(int distance READ distance WRITE setDistance NOTIFY distanceChanged)
    Q_PROPERTY(bool accState READ accState WRITE setAccState NOTIFY accStateChanged)

public:
    explicit ACC(QObject *parent = nullptr);
    bool ignitionState(); //const;
    void setIgnitionState(bool);
    int engineTemperature();// const;
    void setEngineTemperature(int);
    int fuelLevel(); //const;
    void setFuelLevel(int);
    int distance(); //const;
    void setDistance(int);
    bool accState(); //const;
    void setAccState(bool);

signals:
    void ignitionStateChanged(bool);
     void engineTemperatureChanged(int);
     void fuelLevelChanged(int);
     void distanceChanged(int);
     void accStateChanged(bool);

public slots:


private:
    bool m_ignitionState;
    int m_engineTemperature;
    int m_fuelLevel;
    int m_distance;
    bool m_ACCState;

};

#endif // ACC_H
