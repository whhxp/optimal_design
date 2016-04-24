#include "motor.h"
#include <QtCore>
#include "write_setting.h"
#include "import_csv.h"
#include "executing_vbs.h"
#include <stdlib.h>
//
//命令使用方式，gen [motor ID]
int main(int argc, char *argv[])
{
    int id_num;
    if (argc != 2 || strcmp(argv[1], "--help") == 0)
        printf("%s [motor ID]\n", argv[0]);
    else
    {
        id_num = strtod(argv[1], NULL);
        qDebug() << "ID = " << id_num;
    }

    Write_setting::run(id_num);
    executing_vbs::run(id_num);
    import_csv::run();
    return 0;
}


