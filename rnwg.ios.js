import { NativeModules } from 'react-native';

const { RNWireguard } = NativeModules;

export default {
    Connect(config, session) {
        return RNWireguard._connect(config, session);
    },
    Disconnect() {
        return RNWireguard._disconnect();
    },
    Status() {
        return RNWireguard._status();
    },
    Version() {
        return RNWireguard._version();
    },
    EV_TYPE_EXCEPTION: RNWireguard.EV_TYPE_EXCEPTION,
    EV_TYPE_REGULAR: RNWireguard.EV_TYPE_REGULAR,
    EV_REVOKED:  RNWireguard.EV_REVOKED,
    EV_HOST_DESTROYED: RNWireguard.EV_HOST_DESTROYED,
    EV_HOST_RESUMED: RNWireguard.EV_HOST_RESUMED,
    EV_HOST_PAUSED: RNWireguard.EV_HOST_PAUSED
};
