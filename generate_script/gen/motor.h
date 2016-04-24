#ifndef MOTOR_H
#define MOTOR_H
#include "stator.h"
#include "rotor.h"
#include "magnet.h"
#include "coil.h"
#include <QtCore>



class motor
{
public:
    motor();
    int set_power(int);
    int read_power();
    int     ID;
    int     power;
    int     torque;
    double  para[80];
    stator  Stator;
    rotor   Rotor;
    magnet  Magnet;
    coil    Coil;
};

#endif // MOTOR_H
