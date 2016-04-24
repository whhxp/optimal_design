#include "import_csv.h"
#include "db_manipulation.h"

void import_csv::run()
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
*/
    if (!createConnection())
        qDebug() << "Not connected!";
    else
        qDebug() << "Connected!";
    QSqlQuery query;
    QString file = " \'torque.csv\'' ";
    QString table = " motor_performance ";
    QString str = "FIELDS TERMINATED BY \',\'\
            OPTIONALLY ENCLOSED BY \'\"\'   \
            LINES TERMINATED BY \'\\r\n\'  ";
    QString strQuery = "LOAD DATA INFILE " + file + " INTO TABLE " + table + str;
    query.exec(strQuery);
    QSqlDatabase::database().commit();
    closeDBConnection();
}

