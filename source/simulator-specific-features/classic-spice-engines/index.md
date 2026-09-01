# Classic SPICE Engines

Qucs-S drives the ngspice and SpiceOpus simulation backends through the same internal `Ngspice` simulator-kernel code path, using the appropriate simulator executable for each backend. Because of this, these two engines share some behaviors that are not present in the other backends — for example, the handling of the `.spiceinit` startup file described below. See [Choosing a Simulation Backend](/overview/choosing-a-sim-backend) for more on how these backends compare.

Xyce, although also SPICE-compatible, is driven through a separate simulator kernel and does not use a `.spiceinit` file.

```{toctree}
---
maxdepth: 1
---
Using .spiceinit Files <using-spiceinit>
```
