#include "import_csv.h"
#include "db_manipulation.h"

QString import(int model_id, QString filename)
{
    QProcess *csv_process = new QProcess;
    QString script = "read_csv.exe ";
    char str_id[10];
    itoa(model_id, str_id, 10);
    QString settingfile;
    settingfile+=str_id;
    qDebug() << settingfile;
    QStringList args;
    args<<QString(QDir::currentPath()+"/"+settingfile+"/"+filename);
    qDebug() <<args;
    csv_process->start (script,args);
    if (!csv_process->waitForFinished(300000))
    {
        qDebug() << "csv handler finished ";
        if (csv_process->exitStatus() == 0)
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
    QString output(csv_process->readAllStandardOutput());
    qDebug() << output;
    delete csv_process;
    csv_process=NULL;
    return output;
}

void ToString(char * outStr, int length, double val)
{
    _snprintf(outStr,length,"%f",val);
}

void import_csv::run(int ID)
{
    QString torque = import(ID,"torque.csv");
    QString coreloss = import(ID,"coreloss.csv");

    QString field = " * ";
    QString str = " where ID =\""+QString::number(1)+"\" ";
    //QString strQuery = "INSERT INTO " + table + " VALUES (?, ?, ?, ?, ?, ?, ?) ";
    insertdb(ID, torque, coreloss);
    return;
}

