# Klaytn Datadog Agent 

This scripts in this repository are the Klaytn Datadog set-up scripts for monitoring the CN and PN nodes of Klaytn.
Through this script, you can monitor Klaytn's Metric, Log, and Infrastructure information.

The Klaytn Metric can see the state of the blockchain by the transaction generation rate, CN node and PN node connection status, CouncilSize, and RoundChange Information.

The Klaytn Log allows you to view real-time block creation results, block numbers, and errors on nodes.

Infra monitoring can see the state of disk, memory, cpu, load average.

## Configuration
* Please refer to the configuration  
[Datadog Tag](https://docs.datadoghq.com/getting_started/tagging/)  
[Datadog OpenMetrics](https://docs.datadoghq.com/integrations/openmetrics/)  
[Datadog Log Configure](https://docs.datadoghq.com/getting_started/logs/)  
[Datadog Network Performance](https://docs.datadoghq.com/network_monitoring/performance/setup/?tab=agentlinux)
  
### Tag
```shell
FILEPATH  : /etc/datadog-agent/datadog.yaml

HOST_NAME : Write your hostname
NODE_TYPE : Write according to the nodetype (e.g. cn or pn)
INSTANCE  : Write according to the instance (e.g. cn or pn1 or pn2)
```
  
### Metrics
```shell
FILEPATH  : /etc/datadog-agent/conf.d/openmetrics.d/conf.yaml

- klaytn_discover_ping
- klaytn_discover_pong
- klaytn_txpool_refuse
- klaytn_chain_finalize
- klaytn_rpc_counts_total
- klaytn_p2p_DialTryCounter
- klaytn_p2p_InboundTraffic
- klaytn_p2p_OutboundTraffic
- klaytn_p2p_CNPeerCountGauge
- klaytn_p2p_ENPeerCountGauge
- klaytn_p2p_PNPeerCountGauge
- klaytn_blockchain_block_tx_counter
- klaytn_blockchain_head_blocknumber
- klaytn_klay_prop_blocks_out_traffic
- klaytn_klay_prop_blocks_in_traffic
- klaytn_blockchain_bad_block_counter
- klaytn_consensus_istanbul_core_round
- klaytn_consensus_istanbul_core_councilSize
- klaytn_chain_validate
- klaytn_tx_pool_pending_gauge
- klaytn_p2p_PeerCountGauge
- klaytn_consensus_istanbul_core_currentRound
- klaytn_chain_inserts
- klaytn_consensus_istanbul_core_timer
- klaytn_tx_pool_queue_gauge
- klaytn_klay_db_chaindata_body_disk_read
- klaytn_klay_db_chaindata_body_disk_write
- klaytn_klay_prop_txns_in_packets
- klaytn_klay_prop_txns_in_traffic
- klaytn_klay_prop_txns_out_packets
- klaytn_klay_prop_txns_out_traffic
- klaytn_klay_prop_blocks_in_packets
- klaytn_klay_prop_blocks_out_packets
- klaytn_p2p_DialFailCounter
```

### CN Node Log
```shell
FILEPATH : /etc/datadog-agent/conf.d/go.d/conf.yaml

logs:
  - type: file
    path: $LOGPATH
    service: klaytn-cn
    source: go
    sourcecategory: sourcecode
```

### Network Performance 
```shell
FILEPATH : /etc/datadog-agent/system-probe.yaml

network_config:   
    enabled: true
```

## Getting Started 

* CN Install
```shell
DD_API_KEY=XXXXXXXXXXXXXXXX HOST_NAME=test-cn NODE_TYPE=cn INSTANCE=cn bash -c "$(curl -L https://raw.githubusercontent.com/Krustuniverse-Klaytn-Group/datadog-agent-install/main/install-datadog-agent.sh)"
```

* PN1 Install
```shell
DD_API_KEY=XXXXXXXXXXXXXXXX HOST_NAME=test-pn1 NODE_TYPE=pn INSTANCE=pn1 bash -c "$(curl -L https://raw.githubusercontent.com/Krustuniverse-Klaytn-Group/datadog-agent-install/main/install-datadog-agent.sh)"
```

* PN2 Install
```shell
DD_API_KEY=XXXXXXXXXXXXXXXX HOST_NAME=test-pn2 NODE_TYPE=pn INSTANCE=pn2 bash -c "$(curl -L https://raw.githubusercontent.com/Krustuniverse-Klaytn-Group/datadog-agent-install/main/install-datadog-agent.sh)"
```