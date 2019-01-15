#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

BITCOINOLDD=${BITCOINOLDD:-$SRCDIR/bitcoinoldd}
BITCOINOLDCLI=${BITCOINOLDCLI:-$SRCDIR/bitcoinold-cli}
BITCOINOLDTX=${BITCOINOLDTX:-$SRCDIR/bitcoinold-tx}
BITCOINOLDQT=${BITCOINOLDQT:-$SRCDIR/qt/bitcoinold-qt}

[ ! -x $BITCOINOLDD ] && echo "$BITCOINOLDD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BOLVER=($($BITCOINOLDCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for bitcoinoldd if --version-string is not set,
# but has different outcomes for bitcoinold-qt and bitcoinold-cli.
echo "[COPYRIGHT]" > footer.h2m
$BITCOINOLDD --version | sed -n '1!p' >> footer.h2m

for cmd in $BITCOINOLDD $BITCOINOLDCLI $BITCOINOLDTX $BITCOINOLDQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BOLVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BOLVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
