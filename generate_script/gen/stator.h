#ifndef STATOR_H
#define STATOR_H
#include <QtCore>

class stator
{
public:
    stator();
    QString Name;
    double DiaGap;
    double DiaYoke;
    double Length;
    double Skew;
    double Slots;
    double SlotType;
    double Hs0;
    double Hs01;
    double Hs1;
    double Hs2;
    double Bs0;
    double Bs1;
    double Bs2;
    double Rs;
    double FilletType;
    double HalfSlot;
    double SegAngle;
    double LenRegion;
    double InfoCore;
    QString color;
    QString MaterialValue;
};

#endif // STATOR_H
