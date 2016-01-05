#include "motor.h"
#include <QtCore>


motor motor1;

class Read_setting : public QThread
{
public:
    Read_setting(QObject *parent = NULL) : QThread(parent)
    {
    }

    void run() Q_DECL_OVERRIDE
    {
        //qsrand(QTime(0, 0, 0).secsTo(QTime::currentTime()));
        QSettings M_settings("setting.txt",
            QSettings::IniFormat);
        M_settings.beginGroup("motor");
        //QStringList keys = M_settings.allKeys();
        motor1.set_power(M_settings.value("power").toInt());
        qDebug() << M_settings.value("power");
        qDebug() << motor1.read_power();
        qDebug() << "From worker thread: " << currentThreadId();
    }
};

//
int main(int argc, char *argv[])
{

    QCoreApplication a(argc, argv);
    qDebug() << "From main thread: " << QThread::currentThreadId();
    Read_setting read_setting;
    QObject::connect(&read_setting, SIGNAL(finished()), &a, SLOT(quit()));

    read_setting.start();
    return a.exec();
}
