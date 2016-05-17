
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <QtNetwork>
#include <QtCore>
#include <QGuiApplication>
#define RCV_BUF_LEN 200

class CServer
    : public QObject
{
    Q_OBJECT
public:
    CServer()
        : m_server(NULL)
    {
        m_server = new QLocalServer(this);
        QObject::connect(m_server, SIGNAL(newConnection()), this, SLOT(serverNewConnectionHandler()));
    }

    ~CServer()
    {
        m_server->close();

        delete m_server;
    }

    void RunServer()
    {
        qDebug() << "Run Server ok";

        QLocalServer::removeServer("ServerName");
        bool ok = m_server->listen("ServerName");
        if (!ok)
        {
            // TODO:
        }
    }

private slots:
    void serverNewConnectionHandler()
    {
        qDebug() << "New Connection";

        QLocalSocket* socket = m_server->nextPendingConnection();
        QObject::connect(socket, SIGNAL(readyRead()), this, SLOT(socketReadyReadHandler()));
        QObject::connect(socket, SIGNAL(disconnected()), socket, SLOT(deleteLater()));
    }

    void socketReadyReadHandler()
    {
        QLocalSocket* socket = static_cast<QLocalSocket*>(sender());
        if (socket)
        {
            QTextStream stream(socket);
            qDebug() << "Read Data From Client:" << stream.readAll();

            QString response = "Hello Client";
            socket->write(response.toUtf8());
            socket->flush();
        }

        // 返回到客户端的void sendMessage方法，m_socket->waitForReadyRead()之后的操作
    }

private:
    QLocalServer *m_server;
};


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    CServer server;
    server.RunServer();

    return app.exec();
}

