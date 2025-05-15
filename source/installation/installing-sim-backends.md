# Installing Simulation Backends

Qucs-S is able to serve as an interface around 6 different simulation backends. However, these 6 backends are not all bundled with a Qucs-S install. See the sections below for information on installing each backend.

```{tip}
For tips on which backend is appropriate for your use case, see [Choosing a Simulation Backend.](/overview/choosing-a-sim-backend)
```

## Executable Paths and Simulator Settings

If you install a simulation backend, but Qucs-S is not showing it in the dropdown menu at the top of the window, you may need to manually point Qucs-S to the simulation executable.

You can do this using the ``Simulate > Simulators Settings`` menu and manually specifying the path, as shown in the image below.

```{figure} /overview/images/simulators-settings-annotated.drawio.png
---
class: with-border
---

Navigating to the _Simulator Settings_ dialog, which allows you to configure the paths to your simulation backend executables.
```

## ngspice

### Windows

ngspice is included with the Qucs-S Windows Installer, no additional installation steps are needed.

### Linux

If you install Qucs-S using the provided packages with your distribution's package manager, ngspice is typically installed as a dependency.

Linux distributions which do not receive official packages from Qucs-S, or users who opt to compile from source, may need to install ngspice manually.

### MacOS

ngspice is NOT included with the ``.dmg``'s provided on the Qucs-S GitHub, or with the homebrew packages. ngspice must be installed manually, alongside Qucs-S.

### Other Platforms

Visit the [ngspice project website](https://ngspice.sourceforge.io/) for installation instructions.

## Xyce

Xyce is not bundled with Qucs-S on any platform, it must be installed separately if desired. It is compatible with Windows (including Windows 11), numerous Linux distributions, and MacOS. For installation instructions, visit the [Xyce project website.](https://xyce.sandia.gov/)

## SpiceOpus

SpiceOpus is also not bundled with Qucs-S on any platform, it must be installed separately if desired. It is currently compatible with Windows and Linux. Visit the [SpiceOpus website](https://www.spiceopus.si/index.html) for installation instructions.

## QucsatorRF

The latest stable QucsatorRF is included with every Qucs-S release package, for all platforms. Unless you are building from source, no additional steps should be necessary to use QucsatorRF as a simulation backend.

