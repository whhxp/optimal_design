#include "executing_vbs.h"
#include <QtCore>
#include <stdlib.h>
void executing_vbs::run(int model_id)
{
    QProcess *vbs_process = new QProcess;
    QString script = "cscript ";
    char str_id[10];
    itoa(model_id, str_id, 10);
    QString settingfile;
    settingfile+=str_id;
    //settingfile+=".ini";
    qDebug() << settingfile;
    QStringList args;
    args<<QString(QDir::currentPath() + "/sample-2d-ipm-v03.vbs")<<settingfile;
    qDebug() <<args;
    vbs_process->start (script,args);
    if (!vbs_process->waitForFinished(300000))
    {
        qDebug() << "vbs finished ";
        if (vbs_process->exitStatus() == 0)
            qDebug() << "0, OK";
        else
        {
            qDebug() <<" error";
        }
    }
    else
    {
        qDebug() << "time out ";
    }

    //QString command;
    //command+= script;
    //command+= QDir::currentPath();
    //command+= "/export.vbs";
    //system(qPrintable(command));//这个是第二种方法，不过信号传递很麻烦
    delete vbs_process;
    vbs_process=NULL;
    return;
}
