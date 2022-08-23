#!/bin/bash

#remove network host
sudo systemctl stop datadog-agent-sysprobe
rm -rf /etc/datadog-agent/system-probe.yaml

#update klaytn metric
cat << EOF > /etc/datadog-agent/conf.d/openmetrics.d/conf.yaml
init_config:

instances:
  - openmetrics_endpoint: http://localhost:61001/metrics
    metrics:
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
EOF

#restart agent
sudo systemctl restart datadog-agent