/*
 * Fedora Media Writer
 * Copyright (C) 2021 Evžen Gasta 
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Window 6.2
import QtQuick.Layouts 6.2
import QtQml 6.2

ApplicationWindow {
    id: mainWindow
    visible: true
    minimumWidth: 800
    minimumHeight: 480
    title: "Fedora Media Writer"
    
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainColumn
    }
        
    Units {
        id: units
    }
    
    ColumnLayout {
        id: mainColumn
        
        Image {
            Layout.alignment: Qt.AlignHCenter
            source: "qrc:/main"
            sourceSize.height: units.gridUnit * 10
        }
    
        Label {
            id: mainLabel
            Layout.alignment: Qt.AlignHCenter
            font.bold: true
            text: "Select Image Source"
            font.pixelSize: units.gridUnit * 1.3
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            
            RadioButton {
                Layout.alignment: Qt.AlignLeft
                checked: true
                text: "Download automatically"
                font.pixelSize: units.gridUnit
            }
    
            RadioButton {
                Layout.alignment: Qt.AlignLeft
                text: "Select .iso file"
                font.pixelSize: units.gridUnit
            }
        }
        
        RowLayout {
            Layout.margins: units.gridUnit * 1.3
            Layout.alignment: Qt.AlignBottom
            Button {
                id: aboutButton
                text: qsTr("About")
                font.pixelSize: units.gridUnit
            }
        
            Item {
                Layout.fillWidth: true
            }
            
            Button {
                id: nextButton
                text: qsTr("Next")
                font.pixelSize: units.gridUnit
                onClicked: {
                    stackView.push("SelectFedoraVersionPage.qml")
                }
            }
        }
    }
}

