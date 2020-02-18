-- tx_io.sql
-- Neptune Research 2020-02-08

-- Requires: tx_extra_tag

-- 1. Create the materialized view
-- Note: the FROM clause joins each block on its transactions, so rows will only appear for blocks with CARDINALITY(block.transactions) > 0
CREATE MATERIALIZED VIEW tx_io AS (
    SELECT 
        block.height,
        tx.ordinality AS tx_index,
        CARDINALITY(tx.vin) AS n_input,
        CARDINALITY(tx.vout) AS n_output,
        n_pubkey_additional.n AS n_pubkey_additional
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
    ORDER BY block.height ASC
) WITH NO DATA;

-- 2. Load data (Runtime for height 2029299: 54.6 minutes)
REFRESH MATERIALIZED VIEW tx_io;

-- 3. Get top height in table for reference
SELECT block."height" as height
FROM monero block
ORDER BY block."height" DESC
LIMIT 1;

-- 4. Export: tx_io.csv
\COPY (SELECT * FROM tx_io ORDER BY height ASC, tx_index ASC) TO '/tmp/tx_io.csv' CSV HEADER;