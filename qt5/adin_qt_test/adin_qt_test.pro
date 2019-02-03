QT -= gui

QT       += network

CONFIG += console
CONFIG -= app_bundle
CONFIG += exceptions_off
# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

QMAKE_CXXFLAGS += -fno-rtti -std=c++11

SOURCES += \
    ../src/qtnet.cpp \
    ../../src/logger.cpp \
    ../../src/assertion.cpp \
    ../../src/addressintercept.cpp \
    ../../src/OpenocdClient.cpp \
    ../../test/test.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    ../../export/adin.h \
    ../../export/AddressInterceptPass.h \
    ../../include/client.h \
    ../../include/netwrapper.h \
    ../../include/assertion.h \
    ../../include/logger.h \
    ../../include/OpenocdClient.h \
    ../../test/IrTest.h


INCLUDEPATH += ../../include/
INCLUDEPATH += ../../export/
INCLUDEPATH += ../../
LIBS += ../../test/IrTest.ll
