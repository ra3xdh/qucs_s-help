# Using SPICE Discrete Component Models (.MODEL Directive)

## What is the SPICE .MODEL Directive?

The SPICE ``.MODEL`` directive allows you to specify the parameters necessary to accurately model simple discrete semiconductor devices. This feature allows you to tune the parameters of a device model that's intrinsically understood by SPICE, such as NPN/PNP transistors, diodes, and various MOSFETs.

For example, below is a model of the popular 2N2222 NPN transistor.

```text
.model 2N2222A NPN (Is=14.34f Xti=3 Eg=1.11 Vaf=74.03 Bf=255.9 Ne=1.307 
+ Ise=14.34f Ikf=.2847 Xtb=1.5 Br=6.092 Nc=2 Isc=0 Ikr=0 Rc=1 Cjc=7.306p
+ Mjc=.3416 Vjc=.75 Fc=.5 Cje=22.01p Mje=.377 Vje=.75 Tr=46.91n Tf=411.1p
+ Itf=.6Vtf=1.7 Xtf=3 Rb=10 Vceo=40)
```

Models like these are commonly distributed by electronics manufacturers. Read on to learn how to use them in QUCS-S simulations.

```{tip}
**A model for the component you want to use may already exist in the out-of-the-box library!** QUCS-S ships with a robust library of models for common parts - check it out before importing additional models.

See the [documentation section on Libraries](/libraries/index) for more information on this part of QUCS-S.
```

(importing-with-fill-from-spice)=
## Importing with "Populate Parameters from SPICE File" (recommended)

```{warning}
This section depends on a feature that was not added until QUCS-S ``v24.3.0`` (released July 2024).

**If you are using a QUCS-S version older than ``v24.3.0``, this feature is not available!** You will need to use [the more manual method described in the next section.](#importing-with-manual-spice-netlist-addition)
```

For many of [the blue _Universal Components_ (see here if you're not sure what this means)](/overview/interface-overview.md#component-color-coding), a SPICE model can be directly imported after placing the component on your schematic. To do this, double-click on the component to open the _Edit Properties_ dialog.

```{figure} /subckts-and-ext-models/images/populate-parameters-from-spice-file.drawio.png
---
class: with-border
---

Annotated screenshots showing how to import a SPICE discrete device model (.MODEL directive) using the new _Populate Parameters from SPICE File_ feature (available in QUCS-S ``v24.3.0`` and later).

This specific example shows how to import the model for the popular 2N2222A for an NPN transistor component.
```

### Applicable Components

Out of all the [blue _Universal Components_](/overview/interface-overview.md#component-color-coding) in QUCS-S, only the semiconductor devices include the _Populate Parameters from SPICE File_ feature. At the time of this writing (July 2025), the latest release is QUCS-S ``v25.1.2``, so the following components include this feature:

* ``Diode``
* ``npn transistor`` (with and without substrate connection)
* ``pnp transistor`` (with and without substrate connection)
* ``n-JFET`` (with and without substrate connection)
* ``p-JFET`` (with and without substrate connection)
* ``n-MOSFET`` (with and without substrate connection)
* ``p-MOSFET`` (with and without substrate connection)
* ``depletion MOSFET`` (with and without substrate connection)

All these components are accessible via the _Nonlinear Components_ section of the [_Components Tab_.](/overview/interface-overview.md#components-tab)

(importing-with-manual-spice-netlist-addition)=
## Importing with Manual SPICE Netlist Addition
TODO: Massage [relevant part](https://github.com/ra3xdh/qucs_s-help/blob/master/source/subckts-and-ext-models/habr-tutorial/habr-tutorial-english.md#using-discrete-component-models) of existing tutorial into here.

