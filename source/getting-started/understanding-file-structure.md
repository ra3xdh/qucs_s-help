# Understanding File Structure

To understand how Qucs-S stores files, you must understand at a basic level how the simulation process works.

1. **The schematic is the primary input to a simulation.** It can reference external models (SPICE subcircuits, netlists, Verilog models, etc) if needed, or in simple cases it may only use models built-in to your selected circuit simulator.
2. **When the Simulate button is clicked, the schematic data is fed into the simulator and produces a Dataset.** Datasets are the raw data from a single run of a simulation in a given simulator.
3. **Datasets are used to generate graphical diagrams, so you can interpret your results.** Diagrams include Cartesian plots, Smith charts, polar plots, truth tables, etc. Diagrams are most commonly placed on the same schematic page as your circuit, although they can be placed on separate Data Display Pages if you desire.

The figure below describes this process, and the files it references.

```{figure} /getting-started/images/project-flowchart.drawio.png
---
class: with-border
---

A simplified diagram of the Qucs-S simulation process, showing which files it takes as inputs, and which files are produced as outputs.
```

## Projects

A Qucs-S Project is a folder in the Qucs-S Home Directory, containing multiple files related to Qucs-S simulations (such as schematics, datasets, SPICE models, etc).

To be considered a Project, the folder's name _MUST_ end in ``_prj``. For example, ``myCircuit_prj`` is a valid Project folder name, while ``myCircuit`` is not.

### Qucs-S Home Directory

The Qucs-S home directory will typically default to ``$HOME/QucsWorkspace``. If an older installation of Qucs-S or original Qucs is found, it may default to ``$HOME/.qucs`` instead.

It can be set to an arbitrary location by visiting ``File > Application Settings > Locations > Qucs Home``, as shown in the figure below.

```{figure} /getting-started/images/qucs-s-home-settings.png
---
class: with-border
---

Where to change the Qucs-S home directory, in the File > Application Settings menu.
```

### File Types in a Project

A Project may contain many different types of files, listed below:

**Input Files:**
* **Schematics** (``.sch``): These are the schematic pages within Qucs-S. One project may contain several schematics, and the schematics also support hierarchy (similar to the Hierarchical Sheets feature in KiCAD and other EDA software).
* **SPICE** (``.cir``, ``.ckt``, or ``.sp``): External SPICE models. You may reference these in your Qucs-S schematic.
* **Symbols** (``.sym``): Files created by Qucs-S when adding a _Spice Library Device_ (a method of creating circuit symbols around imported SPICE models). These will reference SPICE files, the SPICE files are _not_ embedded in the ``.sym`` file.
* **Verilog** and **VHDL**: Verilog or VHDL source files, used only for pure-digital simulations.
* **Verilog-A** (``.va``): Analog Verilog-A source files. Further documentation is needed for this feature.

**Output Files:**
* **Datasets** (``.dat``, ``.dat.ngspice``, and ``.dat.xyce``): Raw output data from a simulation run. Extension and format will vary depending on the simulation backend used.
* **Data Displays** (``.dpl``): Pages used only for displaying Diagrams showing simulation results. These are not created automatically, since you can simply place Diagrams directly on your schematics. You may still use them if you prefer.

You can use the Contents tab in the Main Navigation Dock (see [Interface Overview](/getting-started/interface-overview)) to inspect all the files in your current open Qucs-S project. They will be displayed in groups based on the file types described above. An example of how this may look is shown below.

```{figure} /getting-started/images/contents-tab.png
---
class: with-border
---

An example of the Contents tab, showing the files in the currently-opened project, grouped into their types.
```

The example above corresponds to the following structure on the filesystem:

Qucs-S Home Directory (``$HOME/.qucs`` in this case):
* ``test1_bogatin_prj`` : The Project folder
  * ``test1_bogatin.dat.ngspice`` : Raw Dataset output from an ngspice run.
  * ``test1_bogatin.dpl`` : Data Display page.
  * ``test1_bogatin.net`` : Netlist file used by ngspice.
  * ``test1_bogatin.sch`` : Schematic page defining the simulation.

### Sharing Projects (Best Practices)

You may want to share Qucs-S projects between multiple computers. To do this, it's recommended to ZIP up the entire Project folder into an archive file, then unzip the archive into the Qucs-S Home Directory on the second computer. By doing this, Qucs-S will have access to all the needed files, and you will not have any broken references.

```{warning}
Remember that Qucs-S will only consider a folder a _Project_ if its name ends in ``_prj``! If you are unzipping a shared project on your system, be sure your unzipped folder still follows the ``_prj`` naming rule.
```

### Working Outside a Project

It is possible to work outside a Project folder, storing files outside the Qucs-S home directory. You can open any type of Qucs-S supported file (schematic, data display, symbol, etc) using the _Open_ button in the top right of the main window.

However, this may make files difficult to find on your system, since Qucs-S will place the simulation datasets (and any other additional files) next to your Schematic (``.sch``) files on the filesystem.

If you'd like to open a ``.sch`` file and save it into a Project for continued work, simply open it with the Open command, then use the Save As button to save a copy in your Project folder. You can then open your Project and continue your work. 

```{warning}
**If you open a ``.sch`` file in a directory where you do not have write access, you will not be able to display any simulation results!** When you attempt to run a simulation, Qucs-S will be unable to save the simulation _Dataset_ in the same directory as the _Schematic_, and therefore unable to render any _Diagrams_ or otherwise display the output of the simulation.

**This usually applies to the built-in example schematics!** (accessible via ``File > Examples``) These files are stored in the Qucs-S program folder, which is not writeable by normal users on most operating systems. To use these files, you'll need to open them and perform a ``File > Save As`` into a folder where you have write access.
```