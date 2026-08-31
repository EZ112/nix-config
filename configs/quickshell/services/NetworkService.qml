pragma Singleton
import Quickshell.Networking
import QtQuick

QtObject {
    readonly property bool connected: Networking.connectivity !== NetworkConnectivity.None
    readonly property var networkStates: Networking.devices.values.map(d => d.state)
    readonly property NetworkDevice networkDevice: Networking.devices.values.find(d => d.connected) ?? null

    readonly property WifiNetwork wifiNetwork: {
        if (!networkDevice || networkDevice.type !== DeviceType.Wifi)
            return null;
        return networkDevice.networks.values.find(d => d instanceof WifiNetwork && d.connected) ?? null;
    }

    readonly property int strength: {
        if (!wifiNetwork)
            return 0;

        return Math.round(wifiNetwork.signalStrength * 100);
    }

    readonly property list<string> icons: ["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"]
    readonly property string icon: {
        if (!connected || !networkDevice)
            return "󰤭";
        if (networkDevice.type === DeviceType.Wired)
            return "󰈀";

        return icons[Math.min(icons.length - 1, Math.floor(strength / 20))];
    }

    readonly property string label: icon + (networkDevice.type === DeviceType.Wifi ? "  " + strength + "%" : "")
}
