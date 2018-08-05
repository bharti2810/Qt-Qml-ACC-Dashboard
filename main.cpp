#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "acc.h"
#include "dialog.h"
#include "radar.h"
#include <QQmlContext>
#include <QQuickWindow>

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
   //code for integration-from cpp to qml
    // Radar radar;
   // engine.rootContext()->setContextProperty("Radar", &radar);
    QObject *topLevel = engine.rootObjects().value(0);
    QQuickWindow *qmlwindow;
     qmlwindow= qobject_cast<QQuickWindow *>(topLevel);
    //QObject::connect(qmlwindow,SIGNAL(volumeChanged(QVariant)),&radar,SLOT(onVolumeChanged(QVariant)));//++//for qml to cpp
   // QObject::connect(&a1,SIGNAL(rpmChanged(QVariant)),qmlwindow,SLOT(updateRpm(QVariant)));//++//cpp to qml




    //code for dbus
     ACC a1;
    engine.rootContext()->setContextProperty("ACC", &a1);
    a1.setIgnitionState(1);
    a1.setEngineTemperature(110);
    a1.setFuelLevel(1);
    a1.setFractionOfThrottleOpening(0.5);
    a1.setRadarTime(30);
    a1.setAccState(1);
    QDBusConnection::sessionBus().isConnected();
    QDBusConnection::sessionBus().registerService(SERVICE_NAME);
    QDBusConnection::sessionBus().registerObject("/ACC",
                                                 &a1,QDBusConnection::ExportAllProperties);

    QObject::connect(&a1,SIGNAL(rpmChanged(QVariant)),qmlwindow,SLOT(updateRpm(QVariant)));//++//cpp to qml
    QObject::connect(&a1,SIGNAL(speedChanged(QVariant)),qmlwindow,SLOT(updateSpeed(QVariant)));


    return app.exec();
}
