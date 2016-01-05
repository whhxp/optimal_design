#include "motor.h"

motor::motor()
{

}

int motor::set_power(int p)
{
    power = p;
    return 0;
}

int motor::read_power()
{
    return power;
}

