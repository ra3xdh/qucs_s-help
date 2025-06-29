# Using SPICE Complex Device Models (.SUBCKT Directive)

## Introduction
### What is the SPICE .SUBCKT Directive?

```{warning}
Although their names are similar, the SPICE ``.SUBCKT`` directive is different from the [QUCS-S Subcircuits] feature!
```

The SPICE netlist syntax supports subcircuits/hierarchical designs using the ``.SUBCKT`` directive.

Every ``.SUBCKT`` block has a name, and exposes some number of "external ports", each with their own integer "port number". The purpose of each port is often described in the comments of the SPICE netlist file containing the ``.SUBCKT``.

In contrast to the ``.MODEL`` directive, which can only adjust the parameters of standard SPICE device models, a ``.SUBCKT`` can contain an arbitrary circuit with any of the standard SPICE devices, including transistors and diodes with their own customized ``.MODEL`` parameters. ``.SUBCKT``s can also be nested to model more complex devices.

### How are .SUBCKT models distributed?

Most electronics manufacturers will provide SPICE ``.SUBCKT`` models for their integrated circuits (ICs), and even sometimes for complete pluggable electronic modules. These models are simply textual SPICE netlists containing the necessary ``.SUBCKT`` and other directives, typically with the ``.lib`` or ``.cir`` extension.

```{tip}
Many commercial SPICE-based simulators (such as LTspice or PSPICE) include their own extensions to the standard SPICE netlist syntax. 

Unfortunately, some manufacturer-provided SPICE models are designed specifically for one of these commercial simulators, and utilize some of their non-standard syntax.

If you try to run these models in QUCS-S (with ngspice/Xyce/SpiceOpus backends), you may receive some cryptic SPICE netlist syntax errors. You can often get around this problem by [enabling one of the "Compatibility Modes" in your chosen simulation backend.](spice-troubleshooting-and-compatibility-modes)
```

#### Example Model

Below is a model for the popular LM386 [operational amplifier](https://en.wikipedia.org/wiki/Operational_amplifier).

Note that the identifier of the ``.SUBCKT`` directive is ``LM386``, and the exposed ports are ``1``, ``2``, ``99``, ``50``, and ``28``. The functions of each port are described in the comments above the ``.SUBCKT`` directive.

```text
*//////////////////////////////////////////////////////////////////////
* (C) National Semiconductor, Inc.
* Models developed and under copyright by:
* National Semiconductor, Inc.  

*/////////////////////////////////////////////////////////////////////
* Legal Notice: This material is intended for free software support.
* The file may be copied, and distributed; however, reselling the 
*  material is illegal

*////////////////////////////////////////////////////////////////////
* For ordering or technical information on these models, contact:
* National Semiconductor's Customer Response Center
*                 7:00 A.M.--7:00 P.M.  U.S. Central Time
*                                (800) 272-9959
* For Applications support, contact the Internet address:
*  amps-apps@galaxy.nsc.com

*//////////////////////////////////////////////////////////
*LM358 DUAL OPERATIONAL AMPLIFIER MACRO-MODEL
*//////////////////////////////////////////////////////////
*
* connections:      non-inverting input
*                   |   inverting input
*                   |   |   positive power supply
*                   |   |   |   negative power supply
*                   |   |   |   |   output
*                   |   |   |   |   |
*                   |   |   |   |   |
.SUBCKT LM358       1   2  99  50  28
*
*Features:
*Eliminates need for dual supplies
*Large DC voltage gain =             100dB
*High bandwidth =                     1MHz
*Low input offset voltage =            2mV
*Wide supply range =       +-1.5V to +-16V
*
*NOTE: Model is for single device only and simulated
*      supply current is 1/2 of total device current.
*      Output crossover distortion with dual supplies
*      is not modeled.
*
****************INPUT STAGE**************
*
IOS 2 1 5N
*^Input offset current
R1 1 3 500K
R2 3 2 500K
I1 99 4 100U
R3 5 50 517
R4 6 50 517
Q1 5 2 4 QX
Q2 6 7 4 QX
*Fp2=1.2 MHz
C4 5 6 128.27P
*
***********COMMON MODE EFFECT***********
*
I2 99 50 75U
*^Quiescent supply current
EOS 7 1 POLY(1) 16 49 2E-3 1
*Input offset voltage.^
R8 99 49 60K
R9 49 50 60K
*
*********OUTPUT VOLTAGE LIMITING********
V2 99 8 1.63
D1 9 8 DX
D2 10 9 DX
V3 10 50 .635
*
**************SECOND STAGE**************
*
EH 99 98 99 49 1
G1 98 9 POLY(1) 5 6 0 9.8772E-4 0 .3459
*Fp1=7.86 Hz
R5 98 9 101.2433MEG
C3 98 9 200P
*
***************POLE STAGE***************
*
*Fp=2 MHz
G3 98 15 9 49 1E-6
R12 98 15 1MEG
C5 98 15 7.9577E-14
*
*********COMMON-MODE ZERO STAGE*********
*
*Fpcm=10 KHz
G4 98 16 3 49 5.6234E-8               
L2 98 17 15.9M
R13 17 16 1K
*
**************OUTPUT STAGE**************
*
F6 50 99 POLY(1) V6 300U 1
E1 99 23 99 15 1
R16 24 23 17.5
D5 26 24 DX
V6 26 22 .63V
R17 23 25 17.5
D6 25 27 DX
V7 22 27 .63V
V5 22 21 0.27V
D4 21 15 DX
V4 20 22 0.27V
D3 15 20 DX
L3 22 28 500P
RL3 22 28 100K
*
***************MODELS USED**************
*
.MODEL DX D(IS=1E-15)
.MODEL QX PNP(BF=1.111E3)
*
.ENDS
*$
```

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