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
    int     power;
    int     torque;
    stator  Stator;
    rotor   Rotor;
    magnet  Magnet;
    coil    PhaseA;
    coil    PhaseB;
    coil    PhaseC;
};

#endif // MOTOR_H
