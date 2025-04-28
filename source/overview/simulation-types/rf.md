# RF Simulation

```{warning}
This page could still use more content! Contributions are welcome.

If you are willing to contribute documentation, please see [GitHub issue #23](https://github.com/ra3xdh/qucs_s-help/issues/23).
```

Qucs-S also supports a number of simulation devices and techniques that are tailored to RF and microwave (high-frequency) simulation. The specific features available depend on which simulation backend you have selected - see the sections below for more details.

Qucs-S also provides a number of diagrams which are especially useful for microwave and RF circuits. These include:
* Smith Chart
* Admittance Smith Chart
* Polar Complex Plane
* Combined Smith Chart and Complex Plane

## S-Parameter Simulation with ngspice

```{warning}
ngspice introduced S-Parameter Simulation in Version 37 (released mid-2022). Make sure your ngspice backend is Version 37 or later, or you will not be able to take advantage of these features!
```

S-Parameters (Scattering Parameters) are a commonly used tool in high-frequency circuit analysis. For a brief introduction to S-Parameters, [see this video (no affiliation to the Qucs-S project).](https://www.youtube.com/watch?v=-Pi0UbErHTY).

### Setting up the circuit

To use S-Parameter simulation, you must place two special components on your schematic:
* **The "S-Parameter Simulation" simulation component.** This tells Qucs-S that you wish to perform an S-Parameter simulation. Note that this is the same component used in S-Parameter simulations with Qucsator, although that is where the similarities end.
* **The "Power Source" component.** This is the special RF source that will be used to test and obtain the S-Parameters of your circuit.

Examples of each component, and its properties, are shown in the figures below.

```{figure} /overview/images/ngspice-power-source.png
---
class: with-border
---

Example of the _Power Source_ component, for use with ngspice when performing S-Parameter Simulations.
```

```{figure} /overview/images/s-parameter-simulation-component.png
---
class: with-border
---

Example of the _S-Parameter Simulation_ component.
```

As an example, we'll simulate the frequency response of a bandpass filter for the 20-meter band (part of the amateur radio spectrum). The figure below shows the circuit, and the resulting output graphs.

```{figure} /overview/images/s-param-ngspice-example.png
---
class: with-border
---

Example of a bandpass filter (designed for the 20-meter amateur radio band), utilizing the ngspice S-Parameter Simulation feature.
```

The filter itself is made up of LC devices, and the schematic also contains two _Power Source_ components to stimulate the filter. One is connected to the input node (labeled ``in``), and the other is connected to the output node (labeled ``out``).

Finally, the _S-Parameter Simulation_ component defines the frequency sweep range: 6MHz to 20MHz.

### Accessing S-Parameter Outputs from ngspice

After running the simulation, the S-Parameter data can be plotted by referencing special "voltages" that ngspice provides in the simulation output. For example, to plot the {math}`S_{21}` parameter, you'd need to plot the ``v(s_2_1)`` variable.

ngspice also converts the S-Parameters to Y and Z parameters automatically. The Y and Z parameters are also available via special "voltage" variables, in the same syntax as the S parameters. For example, to plot {math}`Y_{11}`, you should select ``v(y_1_1)``.



