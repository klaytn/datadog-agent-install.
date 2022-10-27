#!/bin/bash

sed -i '/^process_config/d' /etc/datadog-agent/datadog.yaml >/dev/null 2>&1
sed -i '/^  enabled/d' /etc/datadog-agent/datadog.yaml >/dev/null 2>&1

cat <<EOF>> /etc/datadog-agent/datadog.yaml

enable_gohai: false

cloud_provider_metadata: [ ]
EOF

NODE_TYPE=`ps -ef |grep kcn |grep -v grep |wc -l`
echo $NODE_TYPE

if [ $NODE_TYPE -ge 1 ]
then
cat <<EOF>> /etc/datadog-agent/datadog.yaml

process_config:
  enabled: true
  blacklist_patterns:
    - ^([^k]|k(k|ck)*([^kc]|c[^kn]))*(k(k|ck)*c?)?$
EOF
#systemctl restart kcnd
else
cat <<EOF>> /etc/datadog-agent/datadog.yaml

process_config:
  enabled: true
  blacklist_patterns:
    - ^([^k]|k(k|pk)*([^kp]|p[^kn]))*(k(k|pk)*p?)?$
EOF
#systemctl restart kpnd
fi
