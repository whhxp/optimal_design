#include <QCoreApplication>
#include <QtCore>

int main(int argc, char *argv[])
{
    //QCoreApplication a(argc, argv);
    QObject *parent;
    QProcess *myprocess = new QProcess(parent);
    QString script = "cscript";
    QStringList args;
    args<<QString(QDir::currentPath()+ "/export.vbs");
    myprocess->start (script,args);
    //system(qPrintable(command));
    qDebug()<<myprocess->exitStatus();
    if (myprocess->exitStatus() == 0)
        qDebug() << "OK";
    //return a.exec();
    return 0;
}

