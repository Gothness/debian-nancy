import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1 as Controls
import SddmComponents 2.0

Row {
    width: 215
    spacing: 60

    property var login: function() {}
    property var reboot: function() {}
    property var shutdown: function() {}

    ImageButton {
        id: loginButton
        source: "artwork/preferences-system-login.png"
        onClicked: login()
    }

    ImageButton {
        id: rebootButton
        source: "artwork/system-reboot.png"
        onClicked: reboot()
    }

    ImageButton {
        id: shutdownButton
        source: "artwork/system-shutdown.png"
        onClicked: shutdown()
    }

}
