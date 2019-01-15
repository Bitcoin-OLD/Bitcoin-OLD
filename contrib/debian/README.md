
Debian
====================
This directory contains files used to package bitcoinoldd/bitcoinold-qt
for Debian-based Linux systems. If you compile bitcoinoldd/bitcoinold-qt yourself, there are some useful files here.

## bitcoinold: URI support ##


bitcoinold-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install bitcoinold-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your bitcoinold-qt binary to `/usr/bin`
and the `../../share/pixmaps/bitcoinold128.png` to `/usr/share/pixmaps`

bitcoinold-qt.protocol (KDE)

