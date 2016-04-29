#ifndef IMPORT_CSV_H
#define IMPORT_CSV_H
#include <QtCore>
#include "general_para.h"
#include <QtSql>

class import_csv
{
public:
    import_csv(int);
    static void run(int); Q_DECL_OVERRIDE
};

#endif // IMPORT_CSV_H
