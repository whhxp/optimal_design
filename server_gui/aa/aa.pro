#-------------------------------------------------
#
# Project created by QtCreator 2016-05-10T16:06:56
#
#-------------------------------------------------

QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = aa
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    mytcpserver.cpp

HEADERS  += mainwindow.h \
    mytcpserver.h

FORMS    += mainwindow.ui
