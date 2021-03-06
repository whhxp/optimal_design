#ifndef MAGNET_H
#define MAGNET_H
#include <QtCore>

class magnet
{
public:
    magnet();
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

#endif // MAGNET_H
