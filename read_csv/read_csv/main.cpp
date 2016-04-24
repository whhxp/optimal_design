
#include <QtCore>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <iostream>

const char* getfield(char* line, int num)
{
    const char* tok;
    for (tok = strtok(line, ",");
            tok && *tok;
            tok = strtok(NULL, ",\r\n"))
    {
        if (!--num)
            return tok;
    }
    return NULL;
}

int main(int argc, char* argv[])
{
    char filename[256];
    if (argc != 2 || strcmp(argv[1], "--help") == 0)
        printf("Usage: %s filename\n", argv[0]);
    else
    {
        strcpy(filename,argv[1]);
        qDebug() << "file = " << filename;
    }

    FILE* stream = fopen( filename, "r");
    char line[1024];
    double sum=0;
    double counter=0;
    double average=0;
    fgets( line, 1024, stream ); //跳过第一行
    while (fgets(line, 1024, stream))
    {
        char* tmp = strdup(line);
        //
        sum=strtod(getfield(tmp, 3),NULL) + sum;
        //printf("Field 3 would be %f\n", sum);
        counter++;
        // NOTE strtok clobbers tmp
        free(tmp);
    }

    average = sum / counter;
    std::cout << average <<std::endl;

    return EXIT_SUCCESS;
}

