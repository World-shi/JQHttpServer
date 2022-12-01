#ifndef WIN_H
#define WIN_H

#include <QDebug>
#include <QNetworkInterface>

class Win: public QObject
{
    Q_OBJECT

public:
    Win();
    ~Win();

    QStringList get_mac();//获取mac函数
    QString getWMIC(const QString &cmd);
    QString result_md5();

};


#endif // WIN_H
