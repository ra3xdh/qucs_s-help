# Using SPICE Complex Device Models (.SUBCKT Directive)

## What is the SPICE .SUBCKT Directive?

TODO: Explain:
* Distinct/different from QUCS-S Subcircuit feature
* What SUBCKT can be used for
* Typically distributed as a .LIB file
* All SPICE SUBCKTs have their own internal port numbers, and these are often labeled with comments at the top of the SPICE file
* Files may even contain multiple hierarchical SUBCKTs, depending on the complexity of the device

## Importing .SUBCKT Models with "SPICE Library Device" (recommended)

```{warning}
This section depends on a feature that was not added until QUCS-S ``v24.3.0`` (released July 2024).

**If you are using a QUCS-S version older than ``v24.3.0``, this feature is not available!** You will need to use [the more manual method described in the next section.](#TODO-update-this-link)
```

### Creating a Custom Symbol File

TODO show how to make a custom .sym file for use with Spice Library Device

## Importing .SUBCKT Models with "SPICE File Component"

```{warning}
TODO: Link to the previous section, warn people that this way still works, but it's not fast/efficient like the new way.
```

### Part 1: Using "SPICE File Component"

TODO show how to place just a SPICE file component

### Part 2: Custom Symbol by Wrapping in a QUCS-S Subcircuit

TODO show how to get a custom symbol by wrapping a SPICE File Component in a subckt