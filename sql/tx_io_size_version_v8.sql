-- tx_io_size_version_v8.sql
-- Neptune Research 2020-02-15

-- Requires: tx_extra_tag, import_tx_size

-- 1. Create the materialized view
-- Note: 
--   a. the FROM clause joins each block on its transactions, so rows will only appear for blocks with CARDINALITY(block.transactions) > 0
--   b. Non-coinbase only because we only use block."transactions" and not block."miner_tx".
--      import_tx_size_1685555_2033559 includes coinbase tx ("coinbase"=TRUE), but we only JOIN on non-coinbase transaction hashes, so they are effectively not included.
CREATE MATERIALIZED VIEW tx_io_size_version_v8 AS (
    SELECT 
        block.height,
        tx.ordinality AS tx_index,
        CARDINALITY(tx.vin) AS n_input,
        CARDINALITY(tx.vout) AS n_output,
        n_pubkey_additional.n AS n_pubkey_additional,
        tx_extended.tx_size,
        OCTET_LENGTH(tx.extra) AS tx_extra_size,
        tx_extended.tx_version,
        tx_extended.rct_type
    FROM monero block,
    LATERAL UNNEST(block.transactions) WITH ORDINALITY tx(hash, version, unlock_time, vin, vout, extra, fee)
    LEFT JOIN LATERAL (
        SELECT 
            COUNT(1) AS n
        FROM tx_extra_tag
        WHERE
            tx_hash = tx.hash
            AND tx_extra_tag_type_id = 7 -- pubkey_additional
    ) n_pubkey_additional ON TRUE
    JOIN import_tx_size_1685555_2033559 tx_extended ON tx_extended.tx_hash = ENCODE(tx.hash, 'hex')
    WHERE block.height >= 1685555   -- Start height of v8
        AND block.height <= 2033559 -- End height of import_tx_size_1685555_2033559 dataset
    ORDER BY block.height ASC
) WITH NO DATA;

-- 2. Load data (Runtime: 2hr 10min)
REFRESH MATERIALIZED VIEW tx_io_size_version_v8;

-- 3. Top height of import_tx_size = 2033559

-- 4. Export: tx_io_size_version_v8.csv (Runtime: 7 min)
\COPY (SELECT * FROM tx_io_size_version_v8 ORDER BY height ASC, tx_index ASC) TO '/tmp/tx_io_size_version_v8.csv' CSV HEADER;