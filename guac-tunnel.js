#!/usr/bin/env node

const GuacamoleLite = require('guacamole-lite');
var cluster = require('cluster');

const websocketOptions = {
    port: 8080 // we will accept connections to this port
};

const guacdOptions = {
    port: 4822 // port of guacd
};

const clientOptions = {
    crypt: {
        cypher: 'AES-256-CBC',
        key: 'MySuperSecretKeyForParamsToken12'
    },
    allowedUnencryptedConnectionSettings: {
        vnc: [
            'width',
            'height',
            'dpi'
        ]
    }
};
if (cluster.isMaster) {
    for (var i = 0; i < 20; i++) {
        cluster.fork();
    }
} else {
    const guacServer = new GuacamoleLite(websocketOptions, guacdOptions, clientOptions);
}
