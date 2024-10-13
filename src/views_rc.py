# Resource object code (Python 3)
# Created by: object code
# Created by: The Resource Compiler for Qt version 6.7.3
# WARNING! All changes made in this file will be lost!

from PySide6 import QtCore

qt_resource_data = b"\
\x00\x00\x01\xca\
i\
mport QtQuick\x0d\x0ai\
mport QtQuick.Co\
ntrols\x0d\x0aimport Q\
tQuick.Window\x0d\x0a\x0d\
\x0aApplicationWind\
ow {\x0d\x0a    id: ap\
p\x0d\x0a    title: ma\
inViewModel.app_\
title\x0d\x0a    visib\
le: true\x0d\x0a    wi\
dth: Screen.widt\
h * 0.8\x0d\x0a    hei\
ght: Screen.heig\
ht * 0.8\x0d\x0a    mi\
nimumHeight: 600\
\x0d\x0a    minimumWid\
th: 900\x0d\x0a\x0d\x0a    C\
omponent.onCompl\
eted: {\x0d\x0a       \
 mainViewModel.i\
nitialize();\x0d\x0a  \
      console.lo\
g('Application l\
oaded');\x0d\x0a    }\x0d\
\x0a\x0d\x0a    Component\
.onDestruction: \
console.log('App\
lication destroy\
ed')\x0d\x0a}\x0d\x0a\
"

qt_resource_name = b"\
\x00\x03\
\x00\x00z\x83\
\x00s\
\x00r\x00c\
\x00\x07\
\x08sX\xbc\
\x00A\
\x00p\x00p\x00.\x00q\x00m\x00l\
"

qt_resource_struct = b"\
\x00\x00\x00\x00\x00\x02\x00\x00\x00\x01\x00\x00\x00\x01\
\x00\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x00\x00\x02\x00\x00\x00\x01\x00\x00\x00\x02\
\x00\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x0c\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\
\x00\x00\x01\x92\x87\xc7\x92u\
"

def qInitResources():
    QtCore.qRegisterResourceData(0x03, qt_resource_struct, qt_resource_name, qt_resource_data)

def qCleanupResources():
    QtCore.qUnregisterResourceData(0x03, qt_resource_struct, qt_resource_name, qt_resource_data)

qInitResources()
