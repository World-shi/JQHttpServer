QT += core network concurrent
QT -= gui

QMAKE_LFLAGS += /MANIFESTUAC:\"level=\'requireAdministrator\' uiAccess=\'false\'\"
CONFIG += c++11
#DESTDIR = ./install

TEMPLATE = app

include( $$PWD/../../library/JQLibrary/JQLibrary.pri )

SOURCES += \
    $$PWD/cpp/main.cpp \
    single_application.cpp

RESOURCES += \
    $$PWD/key/key.qrc

HEADERS += \
    single_application.h
