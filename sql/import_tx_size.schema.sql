-- import_tx_size
-- Neptune Research 2020-02-13

CREATE TABLE import_tx_size (
    "block_height" INT NULL,
    "block_size" INT NULL,
    "tx_index" INT NULL,
    "tx_hash" VARCHAR(64) NULL,
    "coinbase" BOOLEAN NULL,
    "rct_type" INT NULL,
    "tx_size" INT NULL,
    "tx_version" INT NULL
);