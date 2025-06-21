<Qucs Schematic 25.1.2>
<Properties>
  <View=-2809,-1440,2870,1480,0.860929,2254,843>
  <Grid=10,10,1>
  <DataSet=top-level-schematic.dat>
  <DataDisplay=top-level-schematic.dpl>
  <OpenDisplay=0>
  <Script=top-level-schematic.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <Vac V2 1 270 410 18 -26 0 1 "5V" 1 "10k" 1 "0" 0 "0" 0 "0" 0 "0" 0>
  <Vac V1 1 140 410 18 -26 0 1 "10V" 1 "500Hz" 1 "0" 0 "0" 0 "0" 0 "0" 0>
  <GND * 1 270 480 0 0 0 0>
  <GND * 1 140 480 0 0 0 0>
  <R R2 1 140 320 15 -26 0 1 "0.5" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <R R3 1 270 320 15 -26 0 1 "0.5" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <Sub SUB1 1 450 240 6 76 0 0 "voltage-divider.sch" 1>
  <Sub SUB2 1 780 290 -60 54 0 0 "low-pass-filter.sch" 0 "100" 1 "1k" 1>
  <GND * 1 1120 410 0 0 0 0>
  <R R1 1 1120 330 15 -26 0 1 "1 kOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <.TR TR1 1 110 -110 0 62 0 0 "lin" 1 "0" 1 "50m" 1 "1000" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
</Components>
<Wires>
  <270 440 270 480 "" 0 0 0 "">
  <140 440 140 480 "" 0 0 0 "">
  <270 240 270 290 "" 0 0 0 "">
  <140 240 270 240 "" 0 0 0 "">
  <140 240 140 290 "" 0 0 0 "">
  <140 350 140 380 "" 0 0 0 "">
  <270 350 270 380 "" 0 0 0 "">
  <270 240 420 240 "beginning" 270 200 0 "">
  <920 240 1120 240 "" 0 0 0 "">
  <1120 360 1120 410 "" 0 0 0 "">
  <1120 240 1120 300 "" 0 0 0 "">
  <650 240 710 240 "middle" 600 160 13 "">
  <1120 240 1120 240 "load" 1120 190 0 "">
</Wires>
<Diagrams>
  <Rect 350 -72 888 291 3 #c0c0c0 1 00 0 0.002 0.001 0.006 1 -10 5 10 1 -1 0.5 1 315 0 225 1 0 0 "" "" "">
	<"ngspice/tran.v(beginning)" #0000ff 1 3 0 0 0>
	<"ngspice/tran.v(load)" #ff0000 1 3 0 0 0>
	<"ngspice/tran.v(middle)" #aa00ff 1 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Rectangle 100 50 270 490 #000000 3 2 #c0c0c0 1 0>
  <Text 460 70 15 #000000 0 "Section 2:\n0.5X Resistive Divider">
  <Text 120 70 15 #000000 0 "Section 1:\nSuperimposed Sinusoids">
  <Rectangle 410 50 270 490 #000000 3 2 #c0c0c0 1 0>
  <Text 720 60 15 #000000 0 "Section 3:\n1kHz Cutoff RC Filter\n* Eliminates 10kHz Sinusoid\n* Keeps 500Hz Sinusoid">
  <Rectangle 700 50 290 490 #000000 3 2 #c0c0c0 1 0>
  <Rectangle 1010 50 230 490 #000000 3 2 #c0c0c0 1 0>
  <Text 1030 60 15 #000000 0 "Section 4:\nResistive Load">
</Paintings>
