#include <QApplication>
#include <QQmlApplicationEngine>

#include "omx_imageelement.h"
#include "omx_videosurfaceelement.h"
#include "omx_camerasurfaceelement.h"
#include "omx_mediaprocessorelement.h"
#include "omx_audioprocessor.h"
#include "omx_mediaprocessor.h"
#include "lc_logging.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<OMX_ImageElement>("com.luke.qml", 1, 0, "OMXImage");
    qmlRegisterType<OMX_VideoSurfaceElement>("com.luke.qml", 1, 0, "OMXVideoSurface");
    qmlRegisterType<OMX_CameraSurfaceElement>("com.luke.qml", 1, 0, "OMXCameraSurface");
    qmlRegisterType<OMX_MediaProcessorElement>("com.luke.qml", 1, 0, "OMXMediaProcessor");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
