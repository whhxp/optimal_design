#include "write_setting.h"
#include "motor.h"
#include "db_manipulation.h"

Write_setting::Write_setting()
{

}

void Write_setting::run(int ID)
{
    createConnection();
    motor motor1 = read_db(ID);
    closeDBConnection();
    // qsrand(QTime(0, 0, 0).secsTo(QTime::currentTime()));
    char setting_filename[50];
    itoa(int(ID), setting_filename, 50);
    strcat(setting_filename,".ini");
    QSettings M_settings(setting_filename, QSettings::IniFormat);
    // M_settings.beginGroup("motor");
    // QStringList keys = M_settings.allKeys();
    // motor1.set_power(M_settings.value("power").toInt());
    M_settings.setValue("var_stator_DiaGap", motor1.Stator.DiaGap);
    M_settings.setValue("var_stator_DiaYoke", motor1.Stator.DiaYoke);
    M_settings.setValue("var_stator_Length", motor1.Stator.Length);
    M_settings.setValue("var_stator_Skew", motor1.Stator.Skew);
    M_settings.setValue("var_stator_Slots", motor1.Stator.Slots);
    M_settings.setValue("var_stator_SlotType", motor1.Stator.SlotType);
    M_settings.setValue("var_stator_Hs0", motor1.Stator.Hs0);
    M_settings.setValue("var_stator_Hs01", motor1.Stator.Hs01);
    M_settings.setValue("var_stator_Hs1", motor1.Stator.Hs1);
    M_settings.setValue("var_stator_Hs2", motor1.Stator.Hs2);
    M_settings.setValue("var_stator_Bs0", motor1.Stator.Bs0);
    M_settings.setValue("var_stator_Bs1", motor1.Stator.Bs1);
    M_settings.setValue("var_stator_Bs2", motor1.Stator.Bs2);
    M_settings.setValue("var_stator_Rs", motor1.Stator.Rs);
    M_settings.setValue("var_stator_FilletType", motor1.Stator.FilletType);
    M_settings.setValue("var_stator_HalfSlot", motor1.Stator.HalfSlot);
    M_settings.setValue("var_stator_SegAngle", motor1.Stator.SegAngle);
    M_settings.setValue("var_stator_LenRegion", motor1.Stator.LenRegion);
    M_settings.setValue("var_stator_InfoCore", motor1.Stator.InfoCore);
    M_settings.setValue("var_rotor_DiaGap", motor1.Rotor.DiaGap);
    M_settings.setValue("var_rotor_DiaYoke", motor1.Rotor.DiaYoke);
    M_settings.setValue("var_rotor_Length", motor1.Rotor.Length);
    M_settings.setValue("var_rotor_Poles", motor1.Rotor.Poles);
    M_settings.setValue("var_rotor_PoleType", motor1.Rotor.PoleType);
    M_settings.setValue("var_rotor_D1", motor1.Rotor.D1);
    M_settings.setValue("var_rotor_O1", motor1.Rotor.O1);
    M_settings.setValue("var_rotor_O2", motor1.Rotor.O2);
    M_settings.setValue("var_rotor_B1", motor1.Rotor.B1);
    M_settings.setValue("var_rotor_Rib", motor1.Rotor.Rib);
    M_settings.setValue("var_rotor_HRib", motor1.Rotor.HRib);
    M_settings.setValue("var_rotor_DminMag", motor1.Rotor.DminMag);
    M_settings.setValue("var_rotor_thickMag", motor1.Rotor.thickMag);
    M_settings.setValue("var_rotor_WidthMag", motor1.Rotor.WidthMag);
    M_settings.setValue("var_rotor_LenRegion", motor1.Rotor.LenRegion);
    M_settings.setValue("var_rotor_InfoCore", motor1.Rotor.InfoCore);
    M_settings.setValue("var_coil_DiaGap", motor1.Coil.DiaGap);
    M_settings.setValue("var_coil_DiaYoke", motor1.Coil.DiaYoke);
    M_settings.setValue("var_coil_Length", motor1.Coil.Length);
    M_settings.setValue("var_coil_Skew", motor1.Coil.Skew);
    M_settings.setValue("var_coil_Slots", motor1.Coil.Slots);
    M_settings.setValue("var_coil_SlotType", motor1.Coil.SlotType);
    M_settings.setValue("var_coil_Hs0", motor1.Coil.Hs0);
    M_settings.setValue("var_coil_Hs1", motor1.Coil.Hs1);
    M_settings.setValue("var_coil_Hs2", motor1.Coil.Hs2);
    M_settings.setValue("var_coil_Bs0", motor1.Coil.Bs0);
    M_settings.setValue("var_coil_Bs1", motor1.Coil.Bs1);
    M_settings.setValue("var_coil_Bs2", motor1.Coil.Bs2);
    M_settings.setValue("var_coil_Rs", motor1.Coil.Rs);
    M_settings.setValue("var_coil_FilletType", motor1.Coil.FilletType);
    M_settings.setValue("var_coil_Layers", motor1.Coil.Layers);
    M_settings.setValue("var_coil_CoilPitch", motor1.Coil.CoilPitch);
    M_settings.setValue("var_coil_EndExt", motor1.Coil.EndExt);
    M_settings.setValue("var_coil_SpanExt", motor1.Coil.SpanExt);
    M_settings.setValue("var_coil_SegAngle", motor1.Coil.SegAngle);
    M_settings.setValue("var_coil_LenRegion", motor1.Coil.LenRegion);
    M_settings.setValue("var_coil_InfoCore", motor1.Coil.InfoCore);
    M_settings.setValue("var_magnet_DiaGap", motor1.Magnet.DiaGap);
    M_settings.setValue("var_magnet_DiaYoke", motor1.Magnet.DiaYoke);
    M_settings.setValue("var_magnet_Length", motor1.Magnet.Length);
    M_settings.setValue("var_magnet_Poles", motor1.Magnet.Poles);
    M_settings.setValue("var_magnet_PoleType", motor1.Magnet.PoleType);
    M_settings.setValue("var_magnet_D1", motor1.Magnet.D1);
    M_settings.setValue("var_magnet_O1", motor1.Magnet.O1);
    M_settings.setValue("var_magnet_O2", motor1.Magnet.O2);
    M_settings.setValue("var_magnet_B1", motor1.Magnet.B1);
    M_settings.setValue("var_magnet_Rib", motor1.Magnet.Rib);
    M_settings.setValue("var_magnet_HRib", motor1.Magnet.HRib);
    M_settings.setValue("var_magnet_DminMag", motor1.Magnet.DminMag);
    M_settings.setValue("var_magnet_thickMag", motor1.Magnet.thickMag);
    M_settings.setValue("var_magnet_WidthMag", motor1.Magnet.WidthMag);
    M_settings.setValue("var_magnet_LenRegion", motor1.Magnet.LenRegion);
    M_settings.setValue("var_magnet_InfoCore", motor1.Magnet.InfoCore);

    // qDebug() << M_settings.value("power");
    // qDebug() << motor1.read_power();
    //qDebug() << "From worker thread: " << currentThreadId();
    qDebug() << "Writing ini file finished";
}
