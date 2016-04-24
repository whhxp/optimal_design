QT += core sql network
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
    coil.cpp \
    import_csv.cpp \
    write_setting.cpp \
    db_manipulation.cpp \
    executing_vbs.cpp

HEADERS += \
    motor.h \
    generate_script.h \
    stator.h \
    rotor.h \
    magnet.h \
    coil.h \
    import_csv.h \
    write_setting.h \
    db_manipulation.h \
    executing_vbs.h \
    general_para.h
