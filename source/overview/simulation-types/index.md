# Simulation Types

Qucs-S is capable of many different simulation types. It can simulate traditional analog circuits, in the time domain or the frequency domain. It can sweep various parameters of the circuit to quickly compare multiple simulations. Depending on your [selected simulation backend](/overview/choosing-a-sim-backend), it is also capable of Fourier analysis, and many other specialized simulations.

## Simulation Components

Calling a specific simulation in Qucs-S starts with placing a Simulation Component on your schematic page. Once the component is placed, you can click on it and configure its various properties, just like a standard circuit component. Multiple Simulation Components can be placed on a single schematic page, and Qucs-S will process all the simulations when you click the "Run Simulation" button. An example of a Transient Simulation Component, one of the most common types of analog simulations, is shown in the figure below.

```{figure} /overview/images/simulation-component-example.drawio.png
---
class: with-border
---

An example of how to place a Simulation Component in a Qucs-S schematic page, and how to configure the Simulation's parameters.
```

## Learn More

To learn more about Qucs-S's simulation capabilities, please see the specific pages below for common simulation types. Note that this is not exhaustive documentation - it only aims to cover the most frequently used Simulations.

```{toctree}
---
maxdepth: 1
---
analog
sweeps
tuning-mode
digital
rf
```