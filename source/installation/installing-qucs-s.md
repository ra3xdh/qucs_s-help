# Installing QUCS-S

## Windows

For each release, an executable installer (not a ``.msi`` package) is available, as well as a ``.zip`` file containing a portable installation. [Visit the Releases page on GitHub.](https://github.com/ra3xdh/qucs_s/releases)

Both the installer and the portable version include ngspice and QucsatorRF simulation backends.

## Mac OSX

OSX installation ``.dmg``'s are available [with each Release on GitHub.](https://github.com/ra3xdh/qucs_s/releases)

There are also homebrew packages available [in a separate GitHub repository.](https://github.com/ra3xdh/homebrew-qucs-s)

Only the QucsatorRF simulation backend is included with these binaries. Other simulation backends will need to be installed separately.

## Linux

For Debian, Ubuntu, Fedora, and OpenSUSE, [``.deb`` and ``.rpm`` packages are available on the OpenSUSE Build Service.](https://software.opensuse.org/download.html?project=home%3Ara3xdh&package=qucs-s) Simply follow the installation instructions on the build service page.

Arch and Manjaro users may install QUCS-S from [AUR](https://aur.archlinux.org/packages/qucs-s).

AltLinux packages are available from Sysyphus repo, [here.](https://packages.altlinux.org/ru/sisyphus/srpms/qucs-s/)

> **Note: If you install on Ubuntu or Debian using the packages above, the ``ngspice`` simulator and the QucsatorRF simulator are both installed automatically.** Other platforms only come with QucsatorRF installed. If you wish to use any of the other supported simulation backends, you will need to install them separately._

For all other distributions, an AppImage file is available. [Get the latest release from GitHub.](https://github.com/ra3xdh/qucs_s/releases)

## FreeBSD

QUCS-S can be installed on FreeBSD using either ports or a binary package.

* To install ports: ``cd /usr/ports/cad/qucs-s/ && make install clean``
* To install binary package: ``pkg install qucs-s``

Only the QucsatorRF simulation backend is included with this install method. Other simulation backends will need to be installed separately.

## Compiling from Source

Of course, Qucs-S can be compiled from source if desired. See the main [Qucs-S GitHub repository's README](https://github.com/ra3xdh/qucs_s/blob/current/README.md) for the latest information on how to compile from source.

---

Once you have installed QUCS-S, you may need to install simulation backends separately. This is covered in the next chapter.
