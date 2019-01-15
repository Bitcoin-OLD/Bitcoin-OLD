// Copyright (c) 2016 The Bitcoinold Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOINOLD_WALLET_TEST_FIXTURE_H
#define BITCOINOLD_WALLET_TEST_FIXTURE_H

#include "test/test_bitcoinold.h"

/** Testing setup and teardown for wallet.
 */
struct WalletTestingSetup: public TestingSetup {
    WalletTestingSetup(const std::string& chainName = CBaseChainParams::MAIN);
    ~WalletTestingSetup();
};

#endif

