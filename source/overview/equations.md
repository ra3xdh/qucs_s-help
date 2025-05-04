# Using Equations

In many cases, you may wish to perform math operations on the output of a Qucs-S simulation. This is where the "Equations" feature comes into play. Unfortunately, since each [available simulation backend in Qucs-S](/overview/choosing-a-sim-backend) handles equations differently, the equation syntax varies based on which backend you are using.

## Using Equations with ngspice (Nutmeg)

### Introduction to Nutmeg

When using ngspice, Qucs-S leverages its built in "Nutmeg" postprocessor system for an "Equations" functionality.

```{warning}
Note that Nutmeg is _NOT_ the same as the recently-deprecated ``ngnutmeg`` command-line utility. The ngspice manual mentions several times that ``ngnutmeg`` is obsolete, but that does _NOT_ mean that the full Nutmeg functionality is obsolete, and it does not affect the _Nutmeg Equation_ function in Qucs-S.
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

### Nutmeg Syntax Basics

```{tip}
For an exhaustive syntactical reference on ngspice Nutmeg equations, see [the ngspice manual, Section 13 "Interactive Interpreter".](https://ngspice.sourceforge.io/docs/ngspice-html-manual/manual.xhtml#magicparlabel-24725)
```

The Nutmeg equation syntax is relatively simple, and supports all the common mathematical operators, as well as many special functions (trigonometric, logarithmic, etc).

First, it's necessary to understand that ngspice stores all data as a vector. Even scalars are vectors "under the hood", they simply have a length of 1.

Next, understand that you can place comments anywhere you like in a _Nutmeg Equation_. Simply begin the line with ``;``, and that line will be considered a comment. There is no support for "inline" comments - comments must take an entire line.

**Algebraic Operators:**
* ``+`` : Addition
* ``-`` : Subtraction
* ``*`` : Multiplication
* ``/`` : Division
* ``^`` : Exponent
* ``%`` : [Modulo (Remainder)](https://en.wikipedia.org/wiki/Modulo)
* ``,`` : Dual-purpose operator, depending on context.
  * If it is used in the arguments list of a user-definable function, it separates the arguments (like most programming languages).
  * In all other cases, it serves as a way to express complex numbers/vectors. For example, ``x , y`` is synonymous with ``x + j(y)``.

**Boolean/Relational Operators:**
* ``gt`` : Equivalent to {math}`>`
* ``lt`` : Equivalent to {math}`<`
* ``ge`` : Equivalent to {math}`>=`
* ``le`` : Equivalent to {math}`<=`
* ``ne`` : Equivalent to {math}`<>`
* ``and`` : Equivalent to &
* ``or`` : Equivalent to {math}`|`
* ``not`` : Equivalent to {math}`!`
* ``eq`` : Equivalent to {math}`=`

**Built-In Constants:**

**Functions:**


### Example Circuit with Nutmeg Equations

## Using Equations with Qucsator