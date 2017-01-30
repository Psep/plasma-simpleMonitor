/**
 * Copyright 2013-2016 Dhaby Xiloj, Konstantin Shtepa
 *
 * This file is part of plasma-simpleMonitor.
 *
 * plasma-simpleMonitor is free software: you can redistribute it
 * and/or modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation, either
 * version 3 of the License, or any later version.
 *
 * plasma-simpleMonitor is distributed in the hope that it will be
 * useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with plasma-simpleMonitor.  If not, see <http://www.gnu.org/licenses/>.
 **/

import QtQuick 2.0

Row {
    property int uptime: 0

    spacing: 3

    onUptimeChanged: {
        var dhm = [];
        dhm['d'] = Math.floor(uptime/86400);
        dhm['h'] = Math.floor(uptime/3600) - 24*dhm['d'];
        dhm['m'] = Math.floor(uptime/60) - 60*dhm['h'] - 1440*dhm['d']
        uptimeLabel.text = dhm['d'] + 'd ' + dhm['h'] + ':'+ ((dhm['m'] < 10) ? '0' : '') + dhm['m'];
    }

    Text {
        text: i18n("Uptime:")
        color: "#b3b3b3"
    }

    Text {
        id: uptimeLabel
        text: "0d 0:00"
        color: "white"
    }
}
