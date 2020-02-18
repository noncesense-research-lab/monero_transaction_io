# monero_transaction_io
Analysis of Monero transaction inputs and outputs.

Author: Noncesense Research Lab, noncesense.org



## Transaction List (Extended size and version data; Hard fork v8+)
```tx_io_size_version_v8.csv``` lists the input and output count of all individual non-coinbase Monero transactions, with extended size and version data, from height 1685555 to height 2033559.


### Columns

| Column | Type | Description |
| - | - | - |
| ```height``` | Integer | Block height |
| ```tx_index``` | Integer | Transaction number in block, starting at 1 |
| ```n_input``` | Integer | Number of inputs |
| ```n_output``` | Integer | Number of outputs |
| ```n_pubkey_additional``` | Integer | Number of subaddress outputs (parsed from ```tx_extra```) |
| ```tx_size``` | Integer | Transaction size, bytes |
| ```tx_extra_size``` | Integer | Size of ```tx_extra``` only, bytes |
| ```tx_version``` | Integer | Transaction version<br><br> ```Non-RingCT = 1```<br> ```RingCT = 2``` |
| ```rct_type``` | Integer | RingCT type (for ```tx_version = 2```)<br><br> ```RCTTypeNull = 0```<br> ```RCTTypeFull = 1```<br> ```RCTTypeSimple = 2```<br> ```RCTTypeBulletproof = 3```<br> ```RCTTypeBulletproof2 = 4```<br><br> Reference: [ringct/rctTypes.h (Monero 0.15.0.1)](https://github.com/monero-project/monero/blob/master/src/ringct/rctTypes.h) |


### Range

Start block height: 1685555 (2018-10-18, start of hard fork v8)  
End block height: 2033559 (2020-02-14, during  hard fork v12)  
Transaction count: 2887474  
Transaction versions: All  
Transaction types: Non-coinbase only  
CSV file size: 78.6 MB  
CSV number of lines: 2887475  


### Analyses

- [Transaction version distribution since hard fork v8](analysis/tx_version_distribution_v8.md)
- [Extra size distribution since hard fork v8](analysis/tx_extra_size_distribution_v8.md)



## Transaction List (Full chain)
```tx_io.csv``` lists the input and output count of all individual non-coinbase Monero transactions up to height 2029299.


### Columns

| Column | Type | Description |
| - | - | - |
| ```height``` | Integer | Block height |
| ```tx_index``` | Integer | Transaction number in block, starting at 1 |
| ```n_input``` | Integer | Number of inputs |
| ```n_output``` | Integer | Number of outputs |
| ```n_pubkey_additional``` | Integer | Number of subaddress outputs (from tx_extra) |


### Range

Start block height: 0  
End block height: 2029299  
Transaction count: 6331616  
Transaction versions: All  
Transaction types: Non-coinbase only  
CSV file size: 98.8 MB  
CSV number of lines: 6331617  



## I/O Distribution
See other repo: [https://github.com/noncesense-research-lab/tx_in_out_distribution](https://github.com/noncesense-research-lab/tx_in_out_distribution)



## Changelog
- 2-17-20 - Transaction List (Extended size and version data; v8+)
- 2-11-20 - Transaction List (Full chain)