<Qucs Schematic 25.1.2>
<Properties>
  <View=37,171,805,606,2.06912,0,0>
  <Grid=10,10,1>
  <DataSet=voltage-divider.dat>
  <DataDisplay=voltage-divider.dpl>
  <OpenDisplay=0>
  <Script=voltage-divider.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
  <.PortSym -30 0 1 0 P1>
  <Line -30 0 30 0 #000080 2 1>
  <Ellipse 0 -70 170 130 #000000 1 1 #c0c0c0 1 0>
  <Line 170 0 30 0 #000080 2 1>
  <.PortSym 200 0 2 180 P2>
  <Text 30 -20 12 #000000 0 "0.5X\nVoltage Divider">
  <.ID 50 74 SUB>
</Symbol>
<Components>
  <GND * 1 420 540 0 0 0 0>
  <Port P1 1 320 220 -23 12 0 0 "1" 1 "analog" 0>
  <Port P2 1 490 380 4 12 1 2 "2" 1 "analog" 0>
  <R R1 1 420 300 15 -26 0 1 "25" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <R R2 1 420 470 15 -26 0 1 "25" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
</Components>
<Wires>
  <420 380 420 440 "" 0 0 0 "">
  <420 500 420 540 "" 0 0 0 "">
  <420 380 490 380 "" 0 0 0 "">
  <320 220 420 220 "" 0 0 0 "">
  <420 220 420 270 "" 0 0 0 "">
  <420 330 420 380 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
