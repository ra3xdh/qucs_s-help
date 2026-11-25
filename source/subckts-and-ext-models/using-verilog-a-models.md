# Using Verilog-A Models with QUCS-S

(verilog-a-introduction)=
## Introduction

Verilog-A is an HDL (Hardware Description Language) designed for describing models of analog components. It allows users to introduce new device models into a circuit simulator without modifying or recompiling the simulator itself.

This functionality is particularly useful for academic research and semiconductor device modeling, where researchers develop and test new mathematical models of electronic components.

A Verilog-A source file can be compiled into a binary module and loaded into a compatible circuit simulator. [OpenVAF](https://github.com/OpenVAF/OpenVAF-Reloaded) is an open-source compiler for Verilog-A models. It generates OSDI (Open Simulation Data Interface) modules that can be loaded by ngspice. The OpenVAF compiler must be downloaded and installed separately; it is not included in the binary distributions of QUCS-S or Ngspice.

This guide describes how to use Verilog-A models with the QUCS-S + ngspice + OpenVAF combination. The example demonstrates how to compile a tunnel diode model, load it into ngspice, and use it as a component in a QUCS-S schematic.

```{warning}
Verilog-A models compiled into OSDI modules are supported through ngspice. This method is not applicable to the QucsatorRF simulation backend.
```

(verilog-a-compilation)=
## Compiling Verilog-A Models with OpenVAF

Let's consider a Verilog-A model of a tunnel diode.

(verilog-a-tunnel-model)=
### Tunnel Diode Model

The following Verilog-A source code describes the tunnel diode current-voltage characteristic:

```verilog
`include "disciplines.vams"
`include "constants.vams"
module tunnel(Ka, An);
inout Ka, An;
electrical An, Ka;
parameter real Is=1e-12;
parameter real Ip=1e-5;
parameter real Iv=1e-6;
parameter real Vp=0.1;
parameter real Vv=0.4;
parameter real K1=5;
parameter real C=0.01p;
parameter real Temp0=300;
real VT;
analog begin 
VT=(`P_K*Temp0)/`P_Q;
I(An,Ka) <+ Is*(exp(V(An,Ka)/VT)-1.0);
I(An,Ka) <+ ddt(C*V(An,Ka));
I(An,Ka) <+ Iv*exp(K1*(V(An,Ka)-Vv));
I(An,Ka) <+ Ip*(V(An,Ka)/Vp)*exp((Vp-V(An,Ka))/Vp);
end
endmodule
```

This listing should be saved to a file named `tunnel.va` and compiled using OpenVAF.

(verilog-a-openvaf)=
### Compiling the Model

There are two ways to compile Verilog-A models: using the command-line interface (CLI) or the graphical user interface (GUI). Before using the built-in compilation command, make sure that the path to the `OpenVAF` executable is configured in `File → Application Settings → Locations`.

**Command-line compilation**

To compile a Verilog-A source file from the terminal, run:

```bash
openvaf-r tunnel.va
```

**Compilation through the QUCS-S**

Add the Verilog-A source file (`tunnel.va`) to the project. The file will appear in the project tree under the **Verilog-A** section.

Open the Verilog-A source file (`tunnel.va`) in the project tree. Then open the **Project** drop-down menu and select **Build Verilog-A module**.

QUCS-S invokes the OpenVAF compiler to compile the selected `.va` file into an OSDI module. The generated `.osdi` file is placed in the project directory.

If the Verilog-A source file contains no compilation errors, you will see the message "Finished building" and a file named `tunnel.osdi` will be generated. We will need this OSDI file later on.

```{warning}
Some complex Verilog-A models may require external dependencies or additional compiler options. In such cases, the built-in compilation command may not be sufficient, and the model should be compiled separately using the OpenVAF command-line interface.
```

(verilog-a-using-model)=
## Using a Verilog-A Model in QUCS-S

After compiling the Verilog-A source file into an OSDI module, the model can be used in QUCS-S with the ngspice simulation backend. To do this, create a schematic containing a SPICE Generic device, define the model card, and load the OSDI module. If the model is intended to be reused in other projects as a regular graphical component, it can additionally be encapsulated in a Subcircuit with a custom symbol.

### Connecting a Verilog-A Model

First, place the `SPICE Generic device` on the schematic. In its properties, specify the number of pins, the device prefix `N`, and the model name, for example, `tunnel1`. The number of pins must match the port declaration in the Verilog-A module.

```{figure} /subckts-and-ext-models/images/spice-generic-device-properties.png
---
class: with-border
---

Properties of the SPICE Generic device: device prefix "N" and model name "tunnel1".
```

In addition to the `SPICE Generic device`, we place two virtual components: `.MODEL` and `.spiceinit`. Both are located in the `SPICE Netlist sections group`.

Properties of the `.MODEL` component specify the model name `tunnel1`, which must match the model name defined in the `SPICE Generic device` component, and the model parameters, which must correspond to the parameter declarations in the Verilog-A model. If no properties are specified, default values will be used.

```{figure} /subckts-and-ext-models/images/model-component-properties.png
---
class: with-border
---

Properties of the .MODEL component.
```

To load the compiled OSDI module, add the `.spiceinit` component. Enter the `osdi` command followed by the path to the `.osdi` file in its contents. The path must point to an existing file accessible to ngspice when the simulation starts.

The configured `SPICE Generic device` can be used directly in the current schematic. Alternatively, to make it reusable as a separate graphical component, encapsulate it in a QUCS-S subcircuit.

```{figure} /subckts-and-ext-models/images/simulation-results-spice-generic.png
---
class: with-border
---

Simulation results using the SPICE Generic device directly in the schematic, without creating a custom subcircuit symbol.
```

### Creating a Custom subcircuit and Graphical Symbol

To create the subcircuit, use the existing schematic containing the configured `SPICE Generic device`, `.MODEL` and `.spiceinit` components. Add external ports to the subcircuit and connect them to the corresponding terminals of the device. For the tunnel diode, two external ports are required.

```{figure} /subckts-and-ext-models/images/tunnel-diode-subcircuit.png
---
class: with-border
---

Subcircuit schematic with external ports connected to the SPICE Generic device, .MODEL and .spiceinit components.
```

After configuring the schematic, create a graphical symbol for it using the [QUCS-S symbol editor](/subckts-and-ext-models/working-with-subcircuits.md#customizing-a-schematics-symbol). Arrange the symbol pins to match the subcircuit's external ports and save the symbol. The subcircuit can then be reused in other schematics as a regular component, without manually placing the SPICE Generic device, `.MODEL`, and other supporting elements each time.

The QUCS-S distribution includes templates for schematic symbols. These can be found in the directory where the program is installed, under the subdirectory `share/qucs-s/examples/symbols`, in a file named `schematic_symbols.sch`. You can open this file and copy the desired template.

```{warning}
The compiled OSDI file must remain at the same filesystem path specified in the `.spiceinit` component when the subcircuit was created. If the file is moved or the path changes, ngspice will not be able to load the Verilog-A model.
```

```{figure} /subckts-and-ext-models/images/simulation-results-subcircuit.png
---
class: with-border
---

Simulation results using the Verilog-A device encapsulated in a custom QUCS-S subcircuit with a graphical symbol.
```
