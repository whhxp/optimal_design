QT += core
QT -= gui

TARGET = gen
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp \
    motor.cpp \
    generate_script.cpp \
    stator.cpp \
    rotor.cpp \
    magnet.cpp \
    coil.cpp

HEADERS += \
    motor.h \
    generate_script.h \
    stator.h \
    rotor.h \
    magnet.h \
    coil.h
