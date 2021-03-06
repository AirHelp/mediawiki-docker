#!/bin/sh

# See https://github.com/wikimedia/parsoid/blob/master/config.example.yaml
cat <<EOF > ${PARSOID_PATH}/config.yaml
worker_heartbeat_timeout: 300000

logging:
    level: info

services:
  - module: lib/index.js
    entrypoint: apiServiceWorker
    conf:
      mwApis:
      - uri: '${MEDIAWIKI_URL}${MEDIAWIKI_API_ENDPOINT}'
EOF

/usr/bin/node ${PARSOID_PATH}/bin/server.js -c ${PARSOID_PATH}/config.yaml -n 0
