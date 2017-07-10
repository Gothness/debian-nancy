import QtQuick 2.6
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1 as Controls
import SddmComponents 2.0

import "nancy"

Rectangle {

    id: container
    anchors.fill: parent

    property int formWidth: 370
    property int formHeight: 380

    function auth() {
        sddm.login(
            loginForm.login,
            passwordForm.password,
            sessionModel.lastIndex
        )
    }

    Background {
        anchors.fill: parent
        source: "nancy/artwork/background.png"
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

        Column {
            id: inputForm
            y: 150; width: 250; spacing: 8
            anchors.horizontalCenter: parent.horizontalCenter

            LoginForm {
                id: loginForm
                login: userModel.lastUser
                submit: auth
                KeyNavigation.backtab: passwordForm
                KeyNavigation.tab: passwordForm
            }

            PasswordForm {
                id: passwordForm
                submit: auth
                KeyNavigation.backtab: loginForm
                KeyNavigation.tab: loginForm
            }

        }
    }

    ActionButtons {
        id: actionButtons
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 20
        login: auth
        reboot: sddm.reboot
        shutdown: sddm.powerOff
    }

    Component.onCompleted: {
        if (loginForm.login == "")
            loginForm.focus = true
        else
            passwordForm.focus = true
    }

}

