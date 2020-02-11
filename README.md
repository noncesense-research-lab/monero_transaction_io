# monero_transaction_io
Analysis of Monero transaction inputs and outputs.

Author: Noncesense Research Lab, noncesense.org



## Transaction List
```tx_io.csv``` lists the input and output count of all individual Monero transactions up to height 2029299.


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
CSV file size: 98.8 MB  
CSV number of lines: 6331617  


## I/O Distribution
See other repo: [https://github.com/noncesense-research-lab/tx_in_out_distribution](https://github.com/noncesense-research-lab/tx_in_out_distribution)