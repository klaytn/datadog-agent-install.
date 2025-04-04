# Kaia Datadog Agent 

This scripts in this repository are the Kaia Datadog set-up scripts for monitoring the CN and PN nodes of Kaia.
Through this script, you can monitor Kaia's Metric, Log, and Infrastructure information.

The Kaia Metric can see the state of the blockchain by the transaction generation rate, CN node and PN node connection status, CouncilSize, and RoundChange Information.

The Kaia Log allows you to view real-time block creation results, block numbers, and errors on nodes.

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

NODE_NAME : Write your hostname
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
      - klaytn_consensus_istanbul_core_hashLock
      - klaytn_consensus_istanbul_core_committeeSize
      - klaytn_build_info
```

### CN Node Log
```shell
FILEPATH : /etc/datadog-agent/conf.d/go.d/conf.yaml

logs:
  - type: file
    path: $LOG_DIR/kcnd.out
    service: kaia-cn
    source: go
    sourcecategory: sourcecode
```

## Getting Started 

* CN Install
```shell
DD_API_KEY=XXXXXXXXXXXXXXXX NODE_NAME=test-cn-01 NODE_TYPE=cn INSTANCE=cn LOG_DIR=/data/kcnd/log/kcnd.out NETWORK=mainnet bash -c "$(curl -L https://raw.githubusercontent.com/kaiachain/datadog-agent-install./main/install-datadog-agent.sh)"
```

* PN1 Install
```shell
DD_API_KEY=XXXXXXXXXXXXXXXX NODE_NAME=test-pn-01 NODE_TYPE=pn INSTANCE=pn1 NETWORK=mainnet bash -c "$(curl -L https://raw.githubusercontent.com/kaiachain/datadog-agent-install./main/install-datadog-agent.sh)"
```

* PN2 Install
```shell
DD_API_KEY=XXXXXXXXXXXXXXXX NODE_NAME=test-pn-02 NODE_TYPE=pn INSTANCE=pn2 NETWORK=mainnet bash -c "$(curl -L https://raw.githubusercontent.com/kaiachain/datadog-agent-install./main/install-datadog-agent.sh)"
```

* DUAL SHIPPING CN
```shell
NODE_NAME=test-cn-01 NODE_TYPE=cn INSTANCE=cn-01 NETWORK=mainnet bash -c "$(curl -L https://raw.githubusercontent.com/kaiachain/datadog-agent-install./main/dual-shipping/dual-setting_cn.sh)"
```

* DUAL SHIPPING PN
```shell
NODE_NAME=test-pn-01 NODE_TYPE=pn INSTANCE=pn-01 NETWORK=mainnet bash -c "$(curl -L https://raw.githubusercontent.com/kaiachain/datadog-agent-install./main/dual-shipping/dual-setting_pn.sh)"
```