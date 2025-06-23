<Qucs Schematic 25.1.2>
<Properties>
  <View=0,0,1590,898,1,0,0>
  <Grid=10,10,1>
  <DataSet=low-pass-filter.dat>
  <DataDisplay=low-pass-filter.dpl>
  <OpenDisplay=0>
  <Script=low-pass-filter.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <Line -70 -50 10 0 #000080 2 1>
  <Line -40 -60 0 90 #000000 2 1>
  <Line -40 -30 60 0 #000000 1 1>
  <Line 20 -30 40 60 #000000 1 1>
  <Line 130 -50 10 0 #000080 2 1>
  <Rectangle -60 -90 190 140 #000080 1 1 #c0c0c0 1 0>
  <.ID -60 54 SUB "1=Rfilter=1k=Resistor value in the RC filter.=" "1=f_c=1k=Desired cutoff frequency for the RC filter.=">
  <Line 30 -50 0 80 #000000 1 2>
  <Text 30 -70 12 #000000 0 "f_c">
  <Line -40 30 110 0 #000000 2 1>
  <.PortSym -70 -50 1 0 P1>
  <.PortSym 140 -50 2 180 P2>
</Symbol>
<Components>
  <R R1 1 400 350 -26 15 0 0 "Rfilter" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <C C1 1 540 440 17 -26 0 1 "Cfilter" 1 "" 0 "neutral" 0>
  <GND * 1 540 510 0 0 0 0>
  <Port P2 1 640 350 4 12 1 2 "2" 1 "analog" 0>
  <Port P1 1 280 350 -23 12 0 0 "1" 1 "analog" 0>
  <SpicePar SpicePar1 1 280 230 -28 16 0 0 "pi={4*atan(1)}" 1 "Cfilter=(1)/(2*pi*f_c*Rfilter)" 1>
</Components>
<Wires>
  <430 350 540 350 "" 0 0 0 "">
  <540 350 540 410 "" 0 0 0 "">
  <540 350 640 350 "" 0 0 0 "">
  <540 470 540 510 "" 0 0 0 "">
  <280 350 370 350 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
