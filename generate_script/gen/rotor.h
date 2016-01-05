#ifndef ROTOR_H
#define ROTOR_H
#include <QtCore>

class rotor
{
public:
    rotor();
    QString Name;
    double DiaGap;
    double DiaYoke;
    double Length;
    double Poles;
    double PoleType;
    double D1;
    double O1;
    double O2;
    double B1;
    double Rib;
    double HRib;
    double DminMag;
    double thickMag;
    double WidthMag;
    double LenRegion;
    double InfoCore;
    QString color;
};

#endif // ROTOR_H
