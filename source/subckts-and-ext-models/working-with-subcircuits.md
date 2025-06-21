# Working with Subcircuits

Complex electrical circuits are often difficult to manage on a single schematic page. You may also wish to reuse the same circuit across multiple situations, following a hierarchical design paradigm. For these reasons, Qucs-S provides a "Subcircuits" feature.

```{figure} /subckts-and-ext-models/images/hierarchical-design-example.png
---
class: with-border
---

An example of a "hierarchical design" utilizing Qucs-S subcircuits.

The design uses a subcircuit for a resistive voltage divider, and then uses a parameterized subcircuit for a simple RC low-pass filter. Note that the cutoff frequency and resistance values of the filter are set in the top-level context with the ``f_c`` and ``Rfilter`` parameters, instead of being "hardcoded" into the subcircuit itself.
```

Subcircuits are simply references to another standard Qucs-S Schematic file (``.sch``). Any standard ``.sch`` can be used as a subcircuit, as long as at least one "port" is added to the schematic.

```{warning}
This page refers to a different feature from the SPICE ``.SUBCKT`` directive! Qucs-S subcircuits facilitate hierarchical designs using the standard Qucs-S schematic editor, it is unrelated to the SPICE ``.SUBCKT`` feature.
```

### Preparing a Schematic for use as a Subcircuit

The standard Qucs-S schematic editing tools are also used when creating subcircuits (since subcircuits are really just standard ``.sch`` files being referenced in another schematic). However, there are a couple steps to take when preparing a circuit to be used as a subcircuit in a larger schematic.

1. **You MUST create at least one _Subcircuit Port_.** This is your circuit's interface to higher-level schematic files - it is a bidirectional component that allows you to pass signals in and out of your subcircuit. Note that it is NOT necessary to create a port for Ground.
2. **Optionally, you can create a custom symbol for your circuit.** Qucs-S will automatically generate a simple symbol, so this is not a requirement, but it usually improves the usability and readability of your schematic.

#### Creating Ports

Any Qucs-S ``.sch`` schematic file can be used as a subcircuit, as long as at least one _Subcircuit Port_ is added (creating an externally-accessible interface). This component can be accessed from two places:

* The _Lumped Components_ section of the _Components_ tab.
* The quick access symbol toolbar at the top of the Qucs-S window.

As an example, we can create a simple RC filter, with an input and output port. This makes it possible to use it as a subcircuit in another schematic. The figure below shows the filter with the necessary _Subcircuit Ports_.

```{figure} /subckts-and-ext-models/images/subckt-ports-example.drawio.png
---
class: with-border
---

Using _Subcircuit Ports_ to make a schematic usable as a subcircuit.
```

Note that all _Subcircuit Ports_ have a _Number_ attribute, which is exposed "externally" (when your circuit is used as a subcircuit). The numbers are auto-generated upon placement of the component, but they can be manually edited after the fact through the _Properties_ dialog. This can be useful when creating a subcircuit to mimic an off-the-shelf device or integrated circuit, since the pin numbers can be edited to match the real hardware.

The port name (e.g. ``P1``, ``P2``, etc) is NOT exposed externally. However, if you wish to use text to label a subcircuit port, you can add arbitrary text when creating a custom symbol for your circuit.

```{tip}
**It is not necessary to create a _Subcircuit Port_ for your main ground.** The standard _Ground_ component is considered one single net across the entire simulation; it automatically crosses the boundaries of a subcircuit.
```

#### Customizing a Schematic's Symbol

When used as a subcircuit, a Qucs-S schematic file (``.sch``) does not show its entire contents on the parent schematic page where it's referenced. Instead, it exposes a symbol to represent it. If you do not intervene, Qucs-S will automatically generate a simple rectangular symbol, and distribute the _Subcircuit Ports_ across it, as shown in the example below.

```{figure} /subckts-and-ext-models/images/automatic-subckt-symbol.png
---
class: with-border
---

Example of a subcircuit symbol generated automatically by Qucs-S. These symbols can be customized to enhance readability and clarity.
```

The simulation will work using the default auto-generated symbol, but a symbol like this is not very clear. It's difficult to tell what the subcircuit's function is in the parent schematic. For this reason, Qucs-S allows you to customize the symbol that any schematic (``.sch``) exposes when used as a subcircuit.

To access the symbol editor, navigate to your subcircuit ``.sch`` file in the editor, and navigate to _File_ > _Edit Circuit Symbol_. You can also press the ``F9`` keyboard shortcut. This will open the editor for this schematic's symbol. From this window, you can use the normal page editing tools and the graphics components in the _Paintings_ section of the _Components_ tab to customize your circuit symbol.

```{figure} /subckts-and-ext-models/images/customizing-circuit-symbol.drawio.png
---
class: with-border
---

Navigating to the _Circuit Symbol Editor_. This allows you to customize the symbol that a schematic (``.sch``) file exposes when used as a _Subcircuit_ in a parent schematic.
```

#### Configuring Parameters

TODO: Describe how to set up Parameters in the symbol editor

## Using a Subcircuit in a Schematic

### Placing a Subcircuit

To insert a subcircuit, navigate to the _File Components_ section of the _Components_ tab, and place the _Subcircuit_ component on your schematic page.

```{figure} /subckts-and-ext-models/images/unlinked-subckt.drawio.png
---
class: with-border
---

Accessing and placing a _Subcircuit_ on a Qucs-S schematic page.
```

### Manipulating Parameters of a Subcircuit

TODO: show how to manipulate parameters on a subcircuit from a parent schematic. Link to Parameter Sweep page, because I think you can use Parameter Sweep across the "hierarchy".