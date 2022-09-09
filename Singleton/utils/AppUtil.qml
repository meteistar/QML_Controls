pragma Singleton

import QtQuick 2.0

QtObject {
    property string deneme: "Hello from singleton";

    property QtObject font1: FontLoader{
        source: "qrc:/assets/fonts/Nunito-Regular.ttf"
    }
}
