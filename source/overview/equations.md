# Using Equations

In many cases, you may wish to perform math operations on the output of a Qucs-S simulation. This is where the "Equations" feature comes into play. Unfortunately, since each [available simulation backend in Qucs-S](/overview/choosing-a-sim-backend) handles equations differently, the equation syntax varies based on which backend you are using.

## Using Equations with ngspice (Nutmeg)

### Introduction to Nutmeg

When using ngspice, Qucs-S leverages its built in "Nutmeg" postprocessor system for an "Equations" functionality.

```{tip}
For a detailed syntactical reference on ngspice Nutmeg equations, see [the ngspice manual, Section 13 "Interactive Interpreter".](https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#magicparlabel-24725)
```

To use this feature, place a _Nutmeg Equation_ component on your schematic page. You can find this component under the _Equations_ category. An example of the component is shown below, with its Properties dialog annotated.

```{figure} /overview/images/nutmeg-equations-properties-annotated.drawio.png
---
class: with-border
---

An example of a _Nutmeg Equation_ block, and its Properties. Annotated for clarity.
```

```{tip}
**You can select which _Simulation Components_ a given _Nutmeg Equation_ block applies to, within the Properties dialog.**

By default, _Nutmeg Equation_ blocks apply to all simulations on the schematic page. In most cases, this will suffice. However, in particularly complex simulation cases, limiting the scope to certain simulations may reduce simulation time, or reduce the complexity of the output.
```

### Example with Nutmeg Equations

## Using Equations with Qucsator