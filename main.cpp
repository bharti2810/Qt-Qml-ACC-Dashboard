#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "acc.h"
#include "dialog.h"
#include <QQmlContext>

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

    ACC a1;
    engine.rootContext()->setContextProperty("ACC", &a1);
    a1.setIgnitionState(0);
    a1.setEngineTemperature(110);
    a1.setFuelLevel(0);
    a1.setDistance(30);
    a1.setAccState(1);
    QDBusConnection::sessionBus().isConnected();
    QDBusConnection::sessionBus().registerService(SERVICE_NAME);
    QDBusConnection::sessionBus().registerObject("/ACC",
                                                 &a1,QDBusConnection::ExportAllProperties);

    return app.exec();
}
