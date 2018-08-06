/*#ifndef RADAR_H
#define RADAR_H

#include <QObject>
#include <QDebug>
#include<QTimer>
#include "acc.h"

class Radar : public QObject
{
    Q_OBJECT

public:
    explicit Radar(QObject *parent = nullptr);
   // float get_Rpm();

signals:
    void rpmChanged(QVariant);

public slots:
    void onRpmChanged();
private:
   // ACC a;
    float m_rpm;
    float THROTTLE_MAX=5;
    float velocity=0.277777778;
     QTimer *timer;//++
};

#endif // RADAR_H
*/
