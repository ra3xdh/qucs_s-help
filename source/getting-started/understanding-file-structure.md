# Understanding File Structure

## Projects

> What is a Project?

A folder containing files related to Qucs-S simulations.

> How does a Project look on the filesystem?

It's a folder in the Qucs-S home directory, ending in ``_prj``. For example, ``MyTestProject_prj``.

> Where are Projects stored by default?

Typically, ``$HOME/QucsWorkspace``. If an old installation of Qucs or Qucs-S is found that was using ``$HOME/.qucs``, it may default to that instead. You can always change it in File>Application Settings>Locations>Qucs Home.

> How do I open a Project?

Use the Projects tab in the main window. Double-click it, or use the "Open" button. It has to be in the Qucs-S home directory. You can open _individual files_ from outside a project folder in the Qucs-S home directory, but there is no way to treat a folder as a project if it's not in the Qucs-S home directory.

> How do I move a Project from one PC to another?

ZIP up the project folder, then unzip it into the new PC's Qucs-S home directory.

## What can be stored in a Project?

### Outputs
* **Data**: Simulation data output
* **Data Displays**: Disabled by default, recommend placing diagrams on schematics. But if you really wanna use em, how to enable, and what they're for.

### Digital-Only
* Verilog
* Verilog-A: Analog Verilog-A models. See https://github.com/ra3xdh/qucs_s/issues/411

### Octave

``*.m`` Octave files, but unsure if this integration is even still working. Probably make a blank placeholder page and link to that.

### Schematics and Models
* Schematics ``.sch`` files
* Symbols: ``.sym`` used by Spice Library Device. See chapter 8.2 of tutorial https://ra3xdh.github.io/pdf/qucs_s_tutorial.pdf
* SPICE: ``.cir``, ``.ckt``, and ``.sp`` files. Usually contains SPICE models.

### Other

Shows all files with extensions not mentioned above. Interestingly this includes ``.net`` files which I assume are netlists.