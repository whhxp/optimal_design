/****************************************************************************
** Meta object code from reading C++ file 'broadcastrevicethread.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../broadcastrevicethread.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'broadcastrevicethread.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_broadcastrevicethread_t {
    QByteArrayData data[7];
    char stringdata0[68];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_broadcastrevicethread_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_broadcastrevicethread_t qt_meta_stringdata_broadcastrevicethread = {
    {
QT_MOC_LITERAL(0, 0, 21), // "broadcastrevicethread"
QT_MOC_LITERAL(1, 22, 10), // "newFortune"
QT_MOC_LITERAL(2, 33, 0), // ""
QT_MOC_LITERAL(3, 34, 7), // "fortune"
QT_MOC_LITERAL(4, 42, 5), // "error"
QT_MOC_LITERAL(5, 48, 11), // "socketError"
QT_MOC_LITERAL(6, 60, 7) // "message"

    },
    "broadcastrevicethread\0newFortune\0\0"
    "fortune\0error\0socketError\0message"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_broadcastrevicethread[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   24,    2, 0x06 /* Public */,
       4,    2,   27,    2, 0x06 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::Int, QMetaType::QString,    5,    6,

       0        // eod
};

void broadcastrevicethread::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        broadcastrevicethread *_t = static_cast<broadcastrevicethread *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->newFortune((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->error((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (broadcastrevicethread::*_t)(const QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&broadcastrevicethread::newFortune)) {
                *result = 0;
            }
        }
        {
            typedef void (broadcastrevicethread::*_t)(int , const QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&broadcastrevicethread::error)) {
                *result = 1;
            }
        }
    }
}

const QMetaObject broadcastrevicethread::staticMetaObject = {
    { &QThread::staticMetaObject, qt_meta_stringdata_broadcastrevicethread.data,
      qt_meta_data_broadcastrevicethread,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *broadcastrevicethread::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *broadcastrevicethread::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_broadcastrevicethread.stringdata0))
        return static_cast<void*>(const_cast< broadcastrevicethread*>(this));
    return QThread::qt_metacast(_clname);
}

int broadcastrevicethread::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QThread::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void broadcastrevicethread::newFortune(const QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void broadcastrevicethread::error(int _t1, const QString & _t2)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_END_MOC_NAMESPACE
