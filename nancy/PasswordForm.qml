import QtQuick 2.6
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1 as Controls
import SddmComponents 2.0


FocusScope {

    width: parent.width
    height: 40

    property string label: "Password"
    property var submit: function() {}

    readonly property string password: passwordField.text


    Column {

        width: parent.width
        height: parent.height

        Controls.Label{
            text: label
            font.family: "Noto Sans"
            font.pointSize: 12
            font.bold: true
            color: "white"
        }

        PasswordBox{
            id: passwordField
            height: 32
            width: parent.width
            font.family: "Noto Sans"
            font.pointSize: 12
            focus: true
            Keys.onPressed: {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    submit()
                    event.accepted = true
                }
            }
        }
    }
}
