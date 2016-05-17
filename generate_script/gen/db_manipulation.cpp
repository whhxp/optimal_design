#include "db_manipulation.h"
#include "motor.h"

QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");

bool insertdb(int id, QString torque,QString coreloss)
{
    if (!createConnection())
    {
        qDebug() << "upload data Not connected!";
        return 0;
    }
    else
        qDebug() << "upload data Connected!";
    QSqlQuery query;
    //QString table=" motor_performance (ID, torque, coreloss, rpm, inducedvoltage, fluxlinkage, compute_time)";
    query.prepare(QLatin1String("INSERT INTO motor_performance (ID, torque, coreloss, rpm, inducedvoltage, fluxlinkage, compute_time) "
                      "VALUES (?, ?, ?, ?, ?, ?, ?)"));
    query.bindValue(0, id);
    query.bindValue(1, torque.toDouble());
    query.bindValue(2, coreloss.toDouble());
    query.bindValue(3, 1);
    query.bindValue(4, 1);
        query.bindValue(5, 1);
        query.bindValue(6, 1);
    query.exec();
    qDebug() <<QSqlError();
    //QSqlDatabase::database().commit();
    query.clear();
    query.exec("select * from motor_performance;");
    while (query.next())
    {
        qDebug() << query.value(0).toString();
        qDebug() << query.value(1).toString();
        qDebug() << query.value(2).toString();
        qDebug() << query.value(3).toString();
        qDebug() << query.value(4).toString();
        qDebug() << query.value(5).toString();
        qDebug() << query.value(6).toString();
    }
    closeDBConnection();
    return 1;
}

bool createConnection()
{
    //read_db_setting();
    QSettings db_setting("db_setting.ini", QSettings::IniFormat);
    // M_settings.beginGroup("motor");
    // QStringList keys = M_settings.allKeys();
    // motor1.set_power(M_settings.value("power").toInt());
    QString dB_IP=db_setting.value("DB_IP").toString();
    QString dB_NAME=db_setting.value("DB_NAME").toString();
    QString dB_USERNAME=db_setting.value("DB_USERNAME").toString();
    QString dB_PASSWD=db_setting.value("DB_PASSWD").toString();

    db.setHostName(dB_IP);
    db.setDatabaseName(dB_NAME);
    db.setUserName(dB_USERNAME);
    db.setPassword(dB_PASSWD);
    if (!db.open()) {
        qDebug() << "Database opening error occurred";
        return false;
    }
    return true;
}

bool closeDBConnection()
{
    db.close();
    return true;
}

motor read_db(double ID)
{
    motor motor2;
    if (!createConnection())
    {
        qDebug() << "Not connected!";
        return motor2;
    }
    else
        qDebug() << "Connected!";

    QSqlQuery query;
    // QString strQuery = "SELECT DISTINCT " + field + " FROM " + table + str;
    QString field = " * ";
    QString table = " motor_parameter ";
    QString str = " where ID =\""+QString::number(ID)+"\" ";
    QString strQuery = "SELECT " + field + " FROM " + table + str;

    query.exec(strQuery);
    //int counter = 0;
    while (query.next()) {
        //motor2.para[counter]=query.value(counter).toDouble();
        //counter++;
        motor2.ID = query.value(0).toInt();
        motor2.Stator.DiaGap = query.value(1).toDouble();
        motor2.Stator.DiaYoke = query.value(2).toDouble();
        motor2.Stator.Length = query.value(3).toInt();
        motor2.Stator.Skew = query.value(4).toInt();
        motor2.Stator.Slots = query.value(5).toInt();
        motor2.Stator.SlotType = query.value(6).toInt();
        motor2.Stator.Hs0 = query.value(7).toDouble();
        motor2.Stator.Hs01 = query.value(8).toDouble();
        motor2.Stator.Hs1 = query.value(9).toDouble();
        motor2.Stator.Hs2 = query.value(10).toDouble();
        motor2.Stator.Bs0 = query.value(11).toDouble();
        motor2.Stator.Bs1 = query.value(12).toDouble();
        motor2.Stator.Bs2 = query.value(13).toDouble();
        motor2.Stator.Rs = query.value(14).toDouble();
        motor2.Stator.FilletType = query.value(15).toInt();
        motor2.Stator.HalfSlot = query.value(16).toInt();
        motor2.Stator.SegAngle = query.value(17).toInt();
        motor2.Stator.LenRegion = query.value(18).toInt();
        motor2.Stator.InfoCore = query.value(19).toInt();

        motor2.Rotor.DiaGap = query.value(20).toDouble();
        motor2.Rotor.DiaYoke = query.value(21).toDouble();
        motor2.Rotor.Length = query.value(22).toDouble();
        motor2.Rotor.Poles = query.value(23).toDouble();
        motor2.Rotor.PoleType = query.value(24).toDouble();
        motor2.Rotor.D1 = query.value(25).toDouble();
        motor2.Rotor.O1 = query.value(26).toDouble();
        motor2.Rotor.O2 = query.value(27).toDouble();
        motor2.Rotor.B1 = query.value(28).toDouble();
        motor2.Rotor.Rib = query.value(29).toDouble();
        motor2.Rotor.HRib = query.value(30).toDouble();
        motor2.Rotor.DminMag = query.value(31).toDouble();
        motor2.Rotor.thickMag = query.value(32).toDouble();
        motor2.Rotor.WidthMag = query.value(33).toDouble();
        motor2.Rotor.LenRegion = query.value(34).toDouble();
        motor2.Rotor.InfoCore = query.value(35).toDouble();

        motor2.Coil.DiaGap = query.value(36).toDouble();
        motor2.Coil.DiaYoke = query.value(37).toDouble();
        motor2.Coil.Length = query.value(38).toDouble();
        motor2.Coil.Skew = query.value(39).toDouble();
        motor2.Coil.Slots = query.value(40).toDouble();
        motor2.Coil.SlotType = query.value(41).toDouble();
        motor2.Coil.Hs0 = query.value(42).toDouble();
        motor2.Coil.Hs1 = query.value(43).toDouble();
        motor2.Coil.Hs2 = query.value(44).toDouble();
        motor2.Coil.Bs0 = query.value(45).toDouble();
        motor2.Coil.Bs1 = query.value(46).toDouble();
        motor2.Coil.Bs2 = query.value(47).toDouble();
        motor2.Coil.Rs = query.value(48).toDouble();
        motor2.Coil.FilletType = query.value(49).toDouble();
        motor2.Coil.Layers = query.value(50).toDouble();
        motor2.Coil.CoilPitch = query.value(51).toDouble();
        motor2.Coil.EndExt = query.value(52).toDouble();
        motor2.Coil.SpanExt = query.value(53).toDouble();
        motor2.Coil.SegAngle = query.value(54).toDouble();
        motor2.Coil.LenRegion = query.value(55).toDouble();
        motor2.Coil.InfoCore = query.value(56).toDouble();

        motor2.Magnet.DiaGap = query.value(57).toDouble();
        motor2.Magnet.DiaYoke = query.value(58).toDouble();
        motor2.Magnet.Length = query.value(59).toDouble();
        motor2.Magnet.Poles = query.value(60).toDouble();
        motor2.Magnet.PoleType = query.value(61).toDouble();
        motor2.Magnet.D1 = query.value(62).toDouble();
        motor2.Magnet.O1 = query.value(63).toDouble();
        motor2.Magnet.O2 = query.value(64).toDouble();
        motor2.Magnet.B1 = query.value(65).toDouble();
        motor2.Magnet.Rib = query.value(66).toDouble();
        motor2.Magnet.HRib = query.value(67).toDouble();
        motor2.Magnet.DminMag = query.value(68).toDouble();
        motor2.Magnet.thickMag = query.value(69).toDouble();
        motor2.Magnet.WidthMag = query.value(70).toDouble();
        motor2.Magnet.LenRegion = query.value(71).toDouble();
        motor2.Magnet.InfoCore = query.value(72).toDouble();
        // for (int i = 0; i < 73; i++) {
        // qDebug() << query.value(i).toDouble();
        //
        // }
        // qDebug() << "diagap:" << motor1.Stator.DiaGap;
        query.clear();
    }
    closeDBConnection();
    return motor2;
}
