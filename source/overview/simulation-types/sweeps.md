# Parameter Sweep Simulations

Often in circuit simulation, it is useful to repeat a similar simulation while varying one or more parameters. This makes it easy to see how specific parameters affect your circuit's behavior.

```{tip}
You may wish to interactively modify circuit parameters using sliders, rather than defining a range ahead of time and performing a traditional sweep. This is possible using the [Tuning Mode](/overview/simulation-types/tuning-mode) feature!
```

Qucs-S can support this type of simulation using the _Parameter Sweep_ Simulation. This component can sweep the value of a passive component (resistor, inductor, capacitor, or source), or with some additional configuration, can sweep a custom parameter. It accepts an existing Simulation Component as an input, and the Parameter Sweep will repeat that simulation for all the values of the swept parameter.

```{warning}
**The standard Parameter Sweep Simulation can _only_ sweep the values of passive components!** (This includes resistors, capacitors, inductors, and voltage sources.) **On its own, it _cannot_ define and sweep an arbitrary variable in your schematic.**

Defining and sweeping arbitrary variables _is possible_ for some simulation backends, but requires additional steps. See the section below on _Sweeping Arbitrary Parameters_ to learn more.
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

## Sweeping Passive Component Values (Device Sweeps)

The most basic way to utilize the _Parameter Sweep_ Simulation Component is to sweep the value of a passive device (resistor, capacitor, inductor, or source). This is possible using just the Simulation Component itself, no additional SPICE declarations or extra steps needed.

### Example: Capacitor Charging (Before Sweep)

Before adding a sweep, let's consider an example circuit _without_ a sweep. In this circuit, a voltage source is being used to charge a capacitor. At the start of the simulation, the capacitor's voltage is zero. Then, the voltage source turns on and begins charging the capacitor. We can see the capacitor's charge voltage increase on the Cartesian diagram as it charges.

```{figure} /overview/images/cap-charge-simulation-example.png
---
class: with-border
---

A simple capacitor, which is being charged through a resistor. Using a Transient simulation, we can see the capacitor's voltage increase over time, as it is charged by the voltage source.
```

In the next section, we'll look at how a Device Sweep could be performed to give more insight into this circuit.

### Example: Capacitor Charging (With Device Sweep Added)

In the previous example, we might wish to compare how the capacitor charges as we vary resistor ``R1`` (allowing more or less current to flow into the capacitor). This can be done by adding a Parameter Sweep simulation, as shown in the figure below.

```{warning}
**Note that the Parameter Sweep should be added _in addition to_ the existing simulation. Do not delete or deactivate your original simulation component when you add a Sweep.** You must retain your original "unswept" simulation (regardless of what type of simulation it may be), since the Parameter Sweep will reference it.
```

In this new example, 4 Transient Simulations are run, with 4 different values of resistor ``R1`` (200 Ohm, 800 Ohm, 1.4 kOhm, and 2 kOhm). As a result, the 4 distinct capacitor charging curves can be seen on the Cartesian diagram. No modification was required to the diagram's properties compared to the previous example - the complete set of curves was graphed automatically.

```{figure} /overview/images/cap-charge-simulation-sweep-example.png
---
class: with-border
---

By adding a Parameter Sweep simulation component to the previous example, we can now observe the charging behavior of the capacitor as resistor ``R1`` is varied from 200 Ohms to 2 kOhms, in 600 Ohm increments.
```

```{tip}
The value of a voltage source, current source, inductor, or capacitor could also be swept, in the same way as the resistor in the above example.
```

### DC Sweeps

In Qucs-S, a DC Sweep refers to a Parameter Sweep combined with a DC Simulation. This is often useful for determining how a resistor or power supply voltage affects DC bias points.

For example, the circuit below is a simple resistive voltage divider connected to a DC voltage source. A standard DC Simulation can be used to calculate the output voltage of the divider. However, in this example, a Parameter Sweep has been added, sweeping the resistor ``R1`` from 1 kOhm to 4 kOhm.

The resulting output voltage for each value of ``R1`` is displayed in a Table Diagram (although it could just as easily be graphed).

```{figure} /overview/images/dc-sweep-example-annotated.drawio.png
---
class: with-border
---

An example of a "DC Sweep", which combines the Parameter Sweep Simulation with a DC Simulation. In this case, a resistor in a simple voltage divider is swept, and the resulting output voltages are shown in a Table.
```

```{warning}
**Only resistors and sources can be swept as part of a DC Sweep.**

Inductors and capacitors are not considered in DC sweeps (inductors become short-circuits while capacitors become open-circuits). Therefore, these components cannot be swept.

**Sweeping custom parameters in a DC Simulation is _NOT_ possible, regardless of simulation backend!** Even the ``.PARAM`` feature in ngspice (see next section) does not apply to this case - it is simply not possible to sweep anything except a resistor or a source when performing a DC Simulation.
```

## Sweeping Arbitrary Parameters

```{warning}
**This section only applies to recent versions of ngspice! ngspice prior to version 30 (released in 2018) may not support this feature.** This tactic also does not apply to other available simulation backends.
```

## Nesting Sweeps