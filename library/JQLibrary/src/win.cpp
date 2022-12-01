#include "win.h"
#include <QProcess>
#include <QCryptographicHash>
#include <QString>

Win::Win()
{

}


Win::~Win()
{
}


QStringList Win::get_mac()
{
    QStringList mac_list;
    QString strMac;
    QList<QNetworkInterface> ifaces = QNetworkInterface::allInterfaces();
    //返回一个在主机上找到的所有网络接口的列表。如果查找失败，则返回一个0个元素的列表
    for (int i=0; i<ifaces.count(); i++)
        {
            QNetworkInterface iface = ifaces.at(i);

            //过滤掉本地回环地址、没有开启的地址
            if (iface.flags().testFlag(QNetworkInterface::IsUp) && !iface.flags().testFlag(QNetworkInterface::IsLoopBack))
            {
                //过滤掉虚拟地址
                if (!(iface.humanReadableName().contains("VMware",Qt::CaseInsensitive)))
                {
                    strMac = iface.hardwareAddress();
                    mac_list.append(strMac);
                }
            }
        }
        return mac_list;

}

QString Win::getWMIC(const QString &cmd)  //获取硬件信息函数
{
    QProcess p;
        p.start(cmd);
        p.waitForFinished();
        QString result = QString::fromLocal8Bit(p.readAllStandardOutput());
        QStringList list = cmd.split(" ");
        result = result.remove(list.last(), Qt::CaseInsensitive);
        result = result.replace("\r", "");
        result = result.replace("\n", "");
        result = result.simplified();
        return result;
}

QString Win::result_md5()
{
    QString str;

    QStringList maclist=get_mac();
    str = maclist[0];
    qDebug()<< str;

    str += getWMIC("wmic cpu get processorid");  //查询cpu序列号
    qDebug()<< "wmic cpu get processorid " << str;

    str += getWMIC("wmic baseboard get serialnumber");  //查询主板序列号
    qDebug()<< "wmic baseboard get serialnumber " << str;

    str += getWMIC("wmic bios get serialnumber");    //查询BIOS序列号
    qDebug()<< "wmic bios get serialnumber "<< str;

    str += getWMIC("wmic diskdrive get serialnumber");  //查看硬盘
    qDebug()<< "wmic diskdrive get serialnumber " << str;

    str += getWMIC("wmic cpu get Name");                //获取cpu名称
    qDebug()<< "wmic cpu get Name " << str;
    //"Intel(R) Core(TM) i7-3537U CPU @ 2.00GHz"

    str += getWMIC("wmic cpu get NumberOfCores");  //获取cpu核心数
    //"2"
    qDebug()<< "wmic cpu get NumberOfCores "<< str;

    str += getWMIC("wmic cpu get NumberOfLogicalProcessors"); //获取cpu线程数
    //"4"
    qDebug()<< "wmic cpu get NumberOfLogicalProcessors " << str;

    QString md5;
    QByteArray bb;
    bb = QCryptographicHash::hash (str.toLatin1(), QCryptographicHash::Md5 );
    return md5.append(bb.toHex());
}

