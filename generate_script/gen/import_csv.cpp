#include "import_csv.h"
#include "db_manipulation.h"

double import(int model_id, QString filename)
{
    QProcess *csv_process = new QProcess;
    QString script = "read_csv.exe ";
    double result;
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
    return result;
}

void ToString(char * outStr, int length, double val)
{
    _snprintf(outStr,length,"%f",val);
}

void import_csv::run(int ID)
{
/*
 * 路径有限制，只能使用
 * C:\ProgramData\MySQL\MySQL Server 5.7\Data\ga_motor
 *
LOAD DATA INFILE 'torque.csv'
INTO TABLE ga_motor.torque
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

    QString file = " \'torque.csv\'' ";
    QString table = " motor_performance ";
    QString str = "FIELDS TERMINATED BY \',\'\
            OPTIONALLY ENCLOSED BY \'\"\'   \
            LINES TERMINATED BY \'\\r\n\'  ";
    QString strQuery = "LOAD DATA INFILE " + file + " INTO TABLE " + table + str;
    query.exec(strQuery);
    QSqlDatabase::database().commit();
*/
    if (!createConnection())
        qDebug() << "upload data Not connected!";
    else
        qDebug() << "upload data Connected!";
    QSqlQuery query;

    double torque = import(ID,"torque.csv");
    double coreloss = import(ID,"coreloss.csv");
    char s_torque[10], s_coreloss[10];
    ToString(s_torque, 10, torque);
    ToString(s_coreloss, 10, coreloss);
    closeDBConnection();
}

