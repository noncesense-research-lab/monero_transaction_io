# Transaction version distribution since hard fork v8
## Definitions
### RingCT Type ```rct_type```  
Reference: [ringct/rctTypes.h](https://github.com/monero-project/monero/blob/master/src/ringct/rctTypes.h)

```
RCTTypeNull = 0
RCTTypeFull = 1
RCTTypeSimple = 2
RCTTypeBulletproof = 3
RCTTypeBulletproof2 = 4
```

### Transaction Version ```tx_version``` 

```
Non-RingCT = 1
RingCT = 2
```

## Query

```
SELECT
    rct_type,
    tx_version,
    COUNT(1) AS n
FROM import_tx_size_1685555_2033559
GROUP BY rct_type, tx_version
```

## Results

|rct_type|tx_version|n|
|--------|----------|-----|
|0 RCTTypeNull|1 Non-RingCT|88|
|0 RCTTypeNull|2 RingCT|348005|
|1 RCTTypeFull|2 RingCT|28|
|2 RCTTypeSimple|2 RingCT|12|
|3 RCTTypeBulletproof|2 RingCT|543574|
|4 RCTTypeBulletproof2|2 RingCT|2343772|