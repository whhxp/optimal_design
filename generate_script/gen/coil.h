#ifndef COIL_H
#define COIL_H
#include <QtCore>

class coil
{
public:
    coil();

    QString name;
    double DiaGap;
    double DiaYoke;
    double Length;
    double Skew;
    double Slots;
    double SlotType;
    double Hs0;
    double Hs1;
    double Hs2;
    double Bs0;
    double Bs1;
    double Bs2;
    double Rs;
    double FilletType;
    double Layers;
    double CoilPitch;
    double EndExt;
    double SpanExt;
    double SegAngle;
    double LenRegion;
    double InfoCore;
    QString color;
    QString MaterialValue;
};

#endif // COIL_H
