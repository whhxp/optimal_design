#include <QtCore>
#define cmd_work 1
#define cmd_term 0

#define flag_success 0
#define flag_failure 1

int connect_server()
{
    return 1;
}

int connect_psdb()
{
    return 1;
}

void send_signal(int)
{
    return;
}

int request_cmd()
{
    return 0;
}

int execute_evo_motor()
{
    return 0;
}

int main(int argc, char *argv[])
{
    int client_flag, server_cmd;

    if (!connect_server())
    {
        qDebug() << "Not connected control server!";
        return 1;
    }
    else
    {
        qDebug() << "Connected to control server!";
    }
    if (!connect_psdb())
    {
        qDebug() << "Not connected parameter server database!";
        return 1;
    }
    else
    {
        qDebug() << "Connected to parameter server database!";
    }
    while (1)
    {
        server_cmd = request_cmd();
        switch (server_cmd)
        {
            case cmd_work:

                client_flag = execute_evo_motor();
                break;
            case cmd_term:
                qDebug() << "cmd_exit";
                break;
            default:
                qDebug() << "error exit";
                break;
        }
        switch (client_flag)
        {
            case flag_success:
                send_signal(flag_success);
                break;
            case flag_failure:
            default:
                qDebug() << "flag_failure";
                send_signal(flag_failure);
                break;
        }
    }
    return 0;
}

