Shared Libraries
================

## bitcoinoldconsensus

The purpose of this library is to make the verification functionality that is critical to Bitcoinold's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `bitcoinoldconsensus.h` located in  `src/script/bitcoinoldconsensus.h`.

#### Version

`bitcoinoldconsensus_version` returns an `unsigned int` with the API version *(currently at an experimental `0`)*.

#### Script Validation

`bitcoinoldconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `bitcoinoldconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `bitcoinoldconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `bitcoinoldconsensus_SCRIPT_FLAGS_VERIFY_P2SH` - Evaluate P2SH ([BIP16]) subscripts
- `bitcoinoldconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` - Enforce strict DER ([BIP66]) compliance
- `bitcoinoldconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` - Enforce NULLDUMMY ([BIP147])
- `bitcoinoldconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` - Enable CHECKLOCKTIMEVERIFY ([BIP65]
- `bitcoinoldconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` - Enable CHECKSEQUENCEVERIFY ([BIP112]
- `bitcoinoldconsensus_SCRIPT_FLAGS_VERIFY_WITNESS` - Enable WITNESS ([BIP141])

##### Errors
- `bitcoinoldconsensus_ERR_OK` - No errors with input parameters *(see the return value of `bitcoinoldconsensus_verify_script` for the verification status)*
- `bitcoinoldconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `bitcoinoldconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `bitcoinoldconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`
- `bitcoinoldconsensus_ERR_AMOUNT_REQUIRED` - Input amount is required if WITNESS is used
