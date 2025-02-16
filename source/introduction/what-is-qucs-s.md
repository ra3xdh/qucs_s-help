# What is QUCS-S?

QUCS-S is a fork of the popular [Qucs Circuit Simulator](https://qucs.sourceforge.net/). The fork began in 2017.

The "S" in QUCS-S is for [SPICE](https://en.wikipedia.org/wiki/SPICE) - the primary purpose of QUCS-S is to merge the user-friendly Qucs GUI with the power of the SPICE simulation ecosystem.

### QUCS-S vs Qucs

The original Qucs project uses its own SPICE-incompatible simulator, called Qucsator. Qucsator has advanced RF and AC-domain simulation features, but is incompatible with most SPICE models used across industry.

### QUCS-S vs QucsStudio

[QucsStudio](https://qucsstudio.de/) is another simulator package which is also based on the original Qucs project. QucsStudio is freeware, but not open-source. Apart from being forked from the same original Qucs project, QucsStudio has no relation to QUCS-S.

## Simulation Backends

In contrast to Qucs and QucsStudio, QUCS-S does not include its own simulation backend at all. Rather, it serves as a frontend for several different simulation backends:

* **[ngspice (recommended)](https://ngspice.sourceforge.io/)**: A powerful mixed-level/mixed-signal circuit simulator. Most SPICE models distributed across industry are compatible with it. It has excellent performance for time-domain simulation of switching circuits, and a powerful postprocessor. If you are unsure which simulation backend to use with QUCS-S, ngspice is recommended.
* **[Xyce](https://xyce.sandia.gov/)**: A new SPICE-compatible circuit simulator, written from scratch by Sandia National Laboratory. Xyce has the notable advantage of supporting large-scale parallel computing platforms, making it a good fit for solving very large circuits (although it can run on an ordinary desktop platform as well).
* **[SpiceOpus](https://www.spiceopus.si/)**: A free general purpose circuit simulator, based on the Berkeley SPICE-3f5 codebas, specially suited for optimization loops.
* **[QucsatorRF](https://github.com/ra3xdh/qucsator_rf)**: A new simulation engine, intended for RF simulation with microwave devices and microstrip lines. It is distinct from the Qucsator simulator used in the original Qucs project. It is not recommended for general-purpose circuit simulation.

## Supported Platforms

QUCS-S is available for Windows and Mac OSX, as well as numerous Linux distributions.

Keep in mind that simulation backend(s) may need to be installed separately from QUCS-S, depending on your installation platform and method.

See [Installing QUCS-S](/installation/installing-qucs-s) for more information.