// Copyright (c) 2011-2014 The Bitcoinold Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOINOLD_QT_BITCOINOLDADDRESSVALIDATOR_H
#define BITCOINOLD_QT_BITCOINOLDADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class BitcoinoldAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BitcoinoldAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Bitcoinold address widget validator, checks for a valid bitcoinold address.
 */
class BitcoinoldAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BitcoinoldAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // BITCOINOLD_QT_BITCOINOLDADDRESSVALIDATOR_H
