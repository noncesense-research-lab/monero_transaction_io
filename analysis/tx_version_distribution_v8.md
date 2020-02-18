# Transaction version distribution since hard fork v8

## Query

```
SELECT
    rct_type,
    tx_version,
    COUNT(1) AS n
FROM import_tx_size_1685555_2033559
WHERE coinbase = FALSE
GROUP BY rct_type, tx_version
```

## Results

|rct_type|tx_version|n|
|--------|----------|-----|
|0 RCTTypeNull|1 Non-RingCT|88|
|1 RCTTypeFull|2 RingCT|28|
|2 RCTTypeSimple|2 RingCT|12|
|3 RCTTypeBulletproof|2 RingCT|543574|
|4 RCTTypeBulletproof2|2 RingCT|2343772|