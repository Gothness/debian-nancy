import QtQuick 2.6
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1 as Controls

import org.kde.plasma.private.sessions 2.0

import "../nancy"

Rectangle {

    id: container
    anchors.fill: parent

    property int formWidth: 370
    property int formHeight: 380

    function login() {
        authenticator.tryUnlock(passwordForm.password)
    }

    Image {
        id: background
        anchors.fill: parent
        source: "../nancy/artwork/background.png"
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        id: form
        width: formWidth
        height: formHeight
        color: "transparent"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Logo {
            id: logo
            x: -5; anchors.top: parent.top
        }

        PasswordForm {
            id: passwordForm
            y: 150; width: 250;
            anchors.horizontalCenter: parent.horizontalCenter
            submit: login
            focus: true
        }

    }

}

