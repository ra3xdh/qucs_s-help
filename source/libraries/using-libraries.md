# Using Libraries

Once you have a Library (``.lib`` file), you can do one of two things with it:

1. [Set it up as a **User Library**](#setting-up-a-user-library), which is available across _all_ QUCS-S projects opened on your PC.
    * _User Libraries_ will NOT travel with your QUCS-S projects when transferred from one computer to another.
    * **This is what QUCS-S does with new Libraries by default.**
2. [Set it up as a **Project Library**](#setting-up-a-project-library), which is stored within another QUCS-S _Project_.
    * _Project Libraries_ are "portable". They travel anywhere your _Project_ goes, including to another PC.

## Setting up a User Library

If you are [creating a brand new Library manually](/libraries/creating/manual-library-creation), it will be configured as a User Library by default.

If you are importing a pre-existing Library (for example, if a peer has sent you a ``.lib`` file that you want to use), simply copy the file into ``$HOME/QucsWorkspace/user_lib/`` and restart QUCS-S for the changes to take effect.

## Setting up a Project Library

Project Libraries have the advantage of being "portable" with the rest of your QUCS-S Project, unlike User Libraries. This is because Project Libraries are stored in a [QUCS-S Project folder](/overview/understanding-file-structure.md#projects), and therefore travel alongside the rest of the Project (in contrast to a User Library which is stored at the system level).

To configure a Library as a Project Library, simply paste the ``.lib`` file into the Project folder. You may need to close and re-open the Project in QUCS-S for the Library to be recognized.

To access a Project library, first open the Project it's stored in (via the Projects tab). Then, navigate to the Libraries tab. Any Project Libraries should be listed in the "Project Libraries" section of the Libraries tab, as shown in the figure below.

```{figure} /libraries/images/project-library-example.drawio.png
---
class: with-border
---

Example of what a Library configured as a Project Library would look like. This example shows a library ``ExampleLibrary`` containing a single part, ``voltage-divider``. It is stored within the ``SimulationTypes_Examples`` project.
```