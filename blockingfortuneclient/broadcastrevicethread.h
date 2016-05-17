#ifndef BROADCASTREVICETHREAD_H
#define BROADCASTREVICETHREAD_H


#include <QThread>
#include <QMutex>
#include <QWaitCondition>

QT_BEGIN_NAMESPACE
class QLabel;
class QPushButton;
class QUdpSocket;
class QAction;
QT_END_NAMESPACE

class broadcastrevicethread : public QThread
{
    Q_OBJECT

public:
    broadcastrevicethread(QObject *parent = 0);
    ~broadcastrevicethread();

    void requestNewFortune(const QString &hostName, quint16 port);
    void run() Q_DECL_OVERRIDE;

signals:
    void newFortune(const QString &fortune);
    void error(int socketError, const QString &message);

private:
    QString hostName;
    quint16 port;
    QMutex mutex;
    QWaitCondition cond;
    bool quit;
};
#endif // BROADCASTREVICETHREAD_H
