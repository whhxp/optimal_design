#ifndef GENERATE_SCRIPT_H
#define GENERATE_SCRIPT_H
#include <QtCore>

class generate_script : public QThread
{
public:
    generate_script(QObject *parent = NULL);
    void run(); Q_DECL_OVERRIDE
};

#endif // GENERATE_SCRIPT_H
