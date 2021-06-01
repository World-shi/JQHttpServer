#ifndef SINGLE_APPLICATION_H
#define SINGLE_APPLICATION_H
#include <QCoreApplication>
#include <QLocalServer>

class SingleApplication:public QCoreApplication
{
    Q_OBJECT
public:
    SingleApplication(int argc,char **argv);

    bool isRunning();

private slots:
    void newLocalConnection();

private:
    QLocalServer *server;

    bool _isRunning;
};

#endif // SINGLE_APPLICATION_H
