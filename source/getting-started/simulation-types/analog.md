# Analog Simulation

Qucs-S can perform a number of different common analog circuit simulation tasks. This page does _not_ seek to be a step-by-step tutorial on each simulation type, but rather a brief overview of Qucs-S's capabilities, with links to more in-depth resources.

## DC Operating Point Simulation

**A DC Operating Point simulation is the simplest type of circuit simulation.** It does not look at transient/alternating current signals at all, but only considers DC circuit elements. A DC operating point simulation will simply output DC bias voltages for each electrical net in your schematic, and output currents for DC sources in your schematic. This is the same type of simulation as the ``.op`` command in other SPICE-based simulators, such as LTSpice.

There are two ways to make Qucs-S perform a DC operating point simulation:

1. Place any other type of simulation component on your schematic. A DC operating point simulation will be included automatically.
2. Place the dedicated "DC Simulation" component on your schematic. Use this if a DC simulation is the _only_ type of simulation you wish to perform.

### Method 1: DC Simulation in Addition to Other Simulation

When any other simulation command (such as Transient, AC, etc) is called on your circuit, Qucs-S will _also_ perform a DC analysis automatically. To view this DC analysis data, either use the ``Simulation > Calculate DC Bias`` menu button, or push the ``F8`` key. This will cause the DC bias voltages and currents to display directly on your schematic page, as in the figure below.

```{figure} /getting-started/images/dc-bias-with-transient.png
---
class: with-border
---

A simple resistive voltage divider, with a transient analysis being performed, and the DC bias data displayed on the schematic. Note the menu button to turn on the DC bias display on the schematic page.
```

### Method 2: DC Simulation Only

If you _only_ wish to perform DC simulation on your circuit, you can place the "DC Simulation" component on your schematic. This will ensure DC simulation occurs when you run the simulation.

You will still need to use the ``Simulation > Calculate DC Bias`` button, or push ``F8``, to display the DC simulation results on your schematic page.

An example of a DC-only simulation is shown below.

```{figure} /getting-started/images/dc-only-simulation.png
---
class: with-border
---

A simple resistive voltage divider, with a DC analysis being performed, and the DC bias data displayed on the schematic. Recall that you must click ``Simulation > Calculate DC Bias`` or push the ``F8`` key to display the DC bias data on the schematic.
```