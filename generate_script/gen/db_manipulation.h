#ifndef DB_MANIPULATION_H
#define DB_MANIPULATION_H
#include "motor.h"
#include <QtCore>
#include <QtSql>

// database setting
/*
#define DB_IP "localhost"
#define DB_USERNAME "gamotor"
#define DB_PASSWD "gamotor"
#define DB_NAME "ga_motor"
*/

bool createConnection();
bool closeDBConnection();
motor read_db(double ID);
int read_db_setting();
bool insertdb(int, QString, QString);

#endif // DB_MANIPULATION_H
