# Extra size distribution since hard fork v8

## Query
```
SELECT 
    OCTET_LENGTH(tx.extra) AS tx_extra_size,
    COUNT(1) AS n
FROM monero block,
LATERAL UNNEST(block.transactions) tx(extra)
WHERE block.height >= 1685555 AND block.height <= 2033559
GROUP BY OCTET_LENGTH(tx.extra)
ORDER BY n DESC
```

## Results

|tx_extra_size|n|
|-------------|-----|
|44|2120171|
|68|369722|
|33|305539|
|547|23726|
|387|19607|
|131|18346|
|163|8712|
|227|3980|
|195|3238|
|291|2597|
|323|2590|
|259|2566|
|355|2464|
|419|1173|
|451|1033|
|483|1022|
|515|947|
|110|15|
|230|5|
|99|5|
|198|3|
|550|2|
|422|2|
|518|1|
|262|1|
|486|1|
|582|1|
|166|1|
|358|1|
|98|1|
|78|1|
|75|1|