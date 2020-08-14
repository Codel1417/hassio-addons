# Home Assistant Add-on: SSH Tunnel

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store**.
2. Add this repository to Home Assistant.
3. Find the "SSH Tunnel" add-on and click it.
4. Click on the "INSTALL" button.

## How to use

The basic thing to get the add-on running would be:

1. Set options on Configuration Tab.
2. Start this Addon.

## Configuration

This add-on has no additional configuration options.

```remote_ip: 0.0.0.0
port: '22'
username: null
base64_key: null
local_ip: 0.0.0.0
```

### Option: 'remote_ip"

The ip of the SSH server this addon will connect to.

Default value: 'null'

### Option: 'port'

The port SSH will use to connect to the server.

Default value: '22'

### Option 'username'

The username SSH will use to connect to the server.

Default value: 'null'

### Option: 'base64_key'

This is a base64 encoded openssh private key. using a passphrase is not supported.

Default value: 'null'

### Option 'local_ip'

This is the ip the ssh tunnel will route to. The ports routed from the server are ```80``` and ```443```.