# Parameter Sweep Simulations

Often in circuit simulation, it is useful to repeat a similar simulation while varying one or more parameters. This makes it easy to see how specific parameters affect your circuit's behavior.

Qucs-S can support this type of simulation using the _Parameter Sweep_ Simulation. This component can sweep the value of a passive component (resistor, inductor, capacitor, or source), or with some additional configuration, can sweep a custom parameter. It accepts an existing Simulation Component as an input, and the Parameter Sweep will repeat that simulation for all the values of the swept parameter.

```{warning}
**The standard Parameter Sweep Simulation can _only_ sweep the values of passive components!** (This includes resistors, capacitors, inductors, and voltage sources.) **On its own, it _cannot_ define and sweep an arbitrary variable in your schematic.**

Defining and sweeping arbitrary variables _is possible_ for some simulation backends, but requires additional steps. See the section below on _Custom Parameter Sweeps_ to learn more.
```

An example of this Simulation Component is shown in the figure below. It's set up to sweep a resistor ``R1``'s value, and repeat the Transient Simulation ``TR1`` for each iteration of ``R1``.

```{figure} /overview/images/parameter-sweep-diagram.drawio.png
---
class: with-border
---

An example of a Parameter Sweep Simulation Component placed on a schematic page. In this case, it is sweeping the value of a resistor (off-screen) being used in a Transient Simulation (``TR1``). Note the flowchart showing the Parameter Sweep's logic.
```

The _Parameter Sweep_ Simulation accepts 6 major inputs:
* **Sim**: This is the ID of the simulation which should be run inside the sweep "loop." For example, in the figure above, ``TR1`` is used, meaning the Parameter Sweep will run a new instance of the ``TR1`` Transient Simulation for each swept value of Resistor ``R1``.
* **Type**: The mathematical distribution of the swept parameter. This can be linear (``lin``), logarithmic (``log``), or a discrete list of values defined by the user (``list``).
* **Param**: The device whose value is to be swept. Typically, this must be a passive component (resistor/capacitor/inductor/source). With additional configuration, some simulation backends may be able to sweep arbitrary variables, rather than being limited to only passive component values. See the section on _Custom Parameter Sweeps_ to learn more.
* **Start**: Defines the start point for the swept device or parameter.
* **Stop**: Defines the end point for the swept device or parameter.
* **Points**: Defines the number of points in the sweep (between the Start and Stop values).

## Device Sweeps

### Special Use Case: DC Sweeps

## Custom Parameter Sweeps (ngspice only!)

```{warning}
**This section only applies to recent versions of ngspice! ngspice prior to version 30 may not support this feature.** This tactic also does not apply to other available simulation backends.
```