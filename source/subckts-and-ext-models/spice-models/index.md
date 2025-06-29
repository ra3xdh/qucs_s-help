# Using SPICE Models

Perhaps the biggest benefit to using the SPICE-based [Simulation Backends](/overview/choosing-a-sim-backend) in QUCS-S is the ability to use industry-standard models for real devices. It's very common for electronics manufacturers to provide free SPICE models for their devices, which you can utilize in simulating your designs.

Read on to learn how to bring these models into QUCS-S.

```{warning}
**The examples in this section of the documentation have all been performed with the ngspice [Simulation Backend](/overview/choosing-a-sim-backend).**

Many of these concepts may also apply to the other SPICE-based backends (Xyce and SPICEOpus), however the syntax may be subtly different in some cases.

None of these examples will work in the QucsatorRF backend (it is not SPICE-compatible).
```

## Modeling Methods

There are essentially two methods for modeling real devices in SPICE-based simulators:
1. **For discrete semiconductors and passives (FETs, BJTs, diodes, etc), you can [use a _Device Model_.](using-discrete-spice-models)**
   * This is most often done with the ``.MODEL`` directive, although sometimes ``.INCLUDE`` may be used as well.
2. **For complex devices (like integrated circuits), you can [use a _Subcircuit Model_.](using-spice-subckt-models)**
   * This is done with the SPICE ``.SUBCKT`` directive.
   * Note that this is NOT the same thing as a [QUCS-S Subcircuit!](/subckts-and-ext-models/working-with-subcircuits)

## Additional Reading

```{toctree}
---
maxdepth: 1
---
Discrete Component Models (.MODEL) <using-discrete-spice-models>
Subcircuit Models for Complex Devices (.SUBCKT) <using-spice-subckt-models>
SPICE Model Compatibility Modes/Troubleshooting <spice-troubleshooting-and-compatibility-modes>
```