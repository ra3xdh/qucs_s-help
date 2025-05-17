# Choosing a Simulation Backend

## Quick Start

Support for multiple simulation backends is one of Qucs-S's key features. Each backend has its own advantages, disadvantages, and differentiating features. This makes Qucs-S an extremely capable and well-rounded simulation platform.

But for new users, this myriad of options can be overwhelming. **To that end, here are some simple rules of thumb to help you select a backend to get going with Qucs-S.**

### Rules of Thumb

1. If your project involves mostly microwave/RF models (such as transmission lines), rather than traditional circuit components, use QucsatorRF.
2. If you know that you need the special additional features of Xyce or SpiceOpus, use one of those engines.
3. Otherwise, use ngspice.

```{tip}

Remember, a simulation backend is not a long-term commitment. You can always change which simulation backend you're using for a given project. See [Interface Overview : Selecting a Simulation Backend](/overview/interface-overview).

```

```{caution}
As your simulations get more sophisticated, or if you begin to run into performance problems, you may need to go beyond the rules of thumb above. Ask for help on [the Qucs-S Discussion Forum](https://github.com/ra3xdh/qucs_s/discussions). More experienced users may be able to speak to the best simulation backend for your particular project.
```

## Complete List of Backends

Qucs-S supports numerous different simulation backends:

### Analog/Digital/RF Simulators
* **[ngspice (recommended)](https://ngspice.sourceforge.io/)**: A powerful mixed-level/mixed-signal circuit simulator. Most SPICE models distributed across industry are compatible with it. It has excellent performance for time-domain simulation of switching circuits, and a powerful postprocessor. If you are unsure which simulation backend to use with QUCS-S, ngspice is recommended.
* **[Xyce](https://xyce.sandia.gov/)**: A new SPICE-compatible circuit simulator, written from scratch by Sandia National Laboratory. Xyce has the notable advantage of supporting large-scale parallel computing platforms, making it a good fit for solving very large circuits (although it can run on an ordinary desktop platform as well).
* **[SpiceOpus](https://www.spiceopus.si/)**: A free general purpose circuit simulator, based on the Berkeley SPICE-3f5 codebase, specially suited for optimization loops.
* **[QucsatorRF](https://github.com/ra3xdh/qucsator_rf)**: A fork of Qucsator, the built-in simulation engine from the original [Qucs](https://qucs.sourceforge.net) project. QucsatorRF shares the original Qucsator netlist syntax, and all RF features. It's primarily intended for RF simulation with microwave devices and microstrip lines. It is not generally recommended for general-purpose circuit simulation, since ngspice typically has better performance.

### Digital-Only Simulators
* **[Icarus Verilog](https://steveicarus.github.io/iverilog/)**: A digital-only simulation backend for simulating Verilog devices.
* **[GHDL](http://ghdl.free.fr/)**: A digital-only simulation backend for simulating VHDL devices. Fully supports the 1987, 1993, 2002 versions of the IEEE 1076 VHDL standard, and partially the latest 2008 revision (well enough to support fixed_generic_pkg or float_generic_pkg).

```{note}
A full feature comparison table is on the to-do list for these docs. If you have knowledge on simulation backends and would like to contribute, please see [issue #21 on the docs repository](https://github.com/ra3xdh/qucs_s-help/issues/21).
```
