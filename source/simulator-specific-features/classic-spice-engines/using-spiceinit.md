# Using .spiceinit Files

## Introduction

The _.spiceinit_ component lets you add custom ngspice or SpiceOpus startup commands to a QUCS-S schematic. It is available from the _SPICE netlist sections_ category of the [Components Tab](/overview/interface-overview.md#components-tab).

```{warning}
If you are using hierarchical design/QUCS-S subcircuits, place the _.spiceinit_ component in the top-level schematic (not the lower-level subcircuit schematics) or you may get unpredictable behavior.
```

## How QUCS-S Regenerates .spiceinit at Simulation Time

```{warning}
Before each simulation, QUCS-S deletes any existing ``.spiceinit`` file in the [working directory](/simulator-specific-features/default-working-directories) it uses for the external SPICE simulators. It then writes a new local ``.spiceinit`` there only if there is content to include: a selected Compatibility Mode directive, an active _.spiceinit_ schematic component, or both. If neither is present, no local ``.spiceinit`` is written.

This delete-and-regenerate behavior applies to both ngspice and SpiceOpus.
```

```{note}
For ngspice specifically:

* When QUCS-S writes a local ``.spiceinit``, ngspice loads that file instead of ``$HOME/.spiceinit``.
* When QUCS-S writes no local ``.spiceinit``, ngspice falls back to its normal startup-file lookup, which may include ``$HOME/.spiceinit``.
```

```{tip}
Environment variables are unaffected by this behavior: QUCS-S launches the simulator with the environment it was itself started in, so any environment variables referenced from within included SPICE files are still inherited normally.
```

## Use Cases

### Selecting an ngspice Compatibility Mode

One use for the _.spiceinit_ component is enabling an [ngspice Compatibility Mode](/subckts-and-ext-models/spice-models/spice-troubleshooting-and-compatibility-modes.md#ngspice-compatibility-modes) for a particular schematic, by placing a compatibility command (such as ``set ngbehavior=ltpsa``) inside it. See [SPICE Model Compatibility Modes & Troubleshooting](/subckts-and-ext-models/spice-models/spice-troubleshooting-and-compatibility-modes) for the full explanation of these modes and when they're needed.

### Resolving External Model References with sourcepath

If your model files depend on additional ngspice startup commands beyond a Compatibility Mode — for example, a ``sourcepath`` entry so a bare ``.include`` or ``.lib`` reference can be resolved — add those commands to the schematic's _.spiceinit_ component so they are included whenever QUCS-S writes a local ``.spiceinit``, rather than relying on ``$HOME/.spiceinit``.
