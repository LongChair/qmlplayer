TEMPLATE = app

QT += qml quick widgets core-private gui-private quick-private

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH

# Default rules for deployment.
include(deployment.pri)

QMAKE_CXXFLAGS += -std=c++11

unix:!macx: LIBS += -L$$PWD/../opt/pi/ -L$$PWD/../opt/pi/3rdparty/ffmpeg/lib/ -lPiOmxTextures -lopenmaxil -lGLESv2 -lEGL -lbcm_host -lvcos -lrt -lv4l2 -lavformat -lavcodec -lavutil -lswscale -lswresample -lfreetype -lWFC -lpcre

INCLUDEPATH += /home/pi/opt/pi/ $$PWD/../opt/pi/ /home/pi/opt/LightLogger

