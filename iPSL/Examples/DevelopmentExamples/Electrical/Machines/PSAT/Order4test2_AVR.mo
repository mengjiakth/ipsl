within iPSL.Examples.DevelopmentExamples.Electrical.Machines.PSAT;
model Order4test2_AVR
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={123.1468,-15.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={39.8634,-35.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Events.PwFault pwFault1(
    R=20,
    X=1,
    t1=3,
    t2=3.1) annotation (Placement(visible=true, transformation(
        origin={132.5,-77.3},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=8,
    t2=8.1) annotation (Placement(visible=true, transformation(
        origin={84.8634,-25.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={39.8634,-15.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={87.5,-50.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={84.8634,-10.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={127.5,-50.0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII AVRtypeIII1
    annotation (Placement(visible=true, transformation(
        origin={-56.6542,-7.4083},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Machines.PSAT.FourthOrder.Order4 order4_Inputs_Outputs(
    V_b=200,
    V_0=1,
    angle_0=0,
    P_0=0.160352698692006,
    Q_0=0.11859436505981,
    Sn=370,
    Vn=200,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0) annotation (Placement(transformation(extent={{-10,-5},{10,15}})));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{50,50},{75,70}})));
equation
  connect(pwLine4.n, pwLoadPQ1.p) annotation (Line(
      visible=true,
      origin={107.0759,-12.6714},
      points={{-15.2125,2},{3.0709,2},{3.0709,8},{16.0709,8}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
      visible=true,
      origin={77.8634,-18.1714},
      points={{0.0,7.5},{0.0,-7.5}}));
  connect(pwFault1.p, pwLine3.n) annotation (Line(
      visible=true,
      origin={105.25,-63.15},
      points={{15.5833,-14.15},{-4.75,-14.15},{-4.75,13.15},{-10.75,13.15}}));
  connect(pwLine3.n, pwLoadPQ2.p) annotation (Line(
      visible=true,
      origin={111.0,-49.5},
      points={{-16.5,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
      visible=true,
      origin={91.8634,-18.1714},
      points={{0.0,-7.5},{0.0,7.5}}));
  connect(pwLine2.n, pwLine4.p) annotation (Line(
      visible=true,
      origin={67.1134,-13.1714},
      points={{-20.25,-2.5},{4.75,-2.5},{4.75,2.5},{10.75,2.5}}));
  connect(pwLine1.n, pwLine3.p) annotation (Line(
      visible=true,
      origin={69.0909,-42.8357},
      points={{-22.2275,7.1643},{5.4091,7.1643},{5.4091,-7.1643},{11.4091,-7.1643}}));
  connect(pwLine1.n, pwLine2.n) annotation (Line(
      visible=true,
      origin={46.8634,-25.6714},
      points={{0.0,-10.0},{0.0,10.0}}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(
      visible=true,
      origin={32.8634,-25.6714},
      points={{0.0,10.0},{0.0,-10.0}}));
  connect(AVRtypeIII1.vf, order4_Inputs_Outputs.vf) annotation (Line(
      points={{-45.6542,-7.4083},{-40,-7.4083},{-40,10},{-10,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order4_Inputs_Outputs.vf0, AVRtypeIII1.vf0) annotation (Line(
      points={{-8,16},{20,16},{20,35},{-80,35},{-80,-10.4083},{-68.6542,-10.4083}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order4_Inputs_Outputs.v, AVRtypeIII1.v) annotation (Line(
      points={{11,8},{25,8},{25,25},{-75,25},{-75,-2.4083},{-68.6542,-2.4083}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order4_Inputs_Outputs.pm0, order4_Inputs_Outputs.pm) annotation (Line(
      points={{-8,-6},{30,-6},{30,-10},{-20,-10},{-20,0},{-10,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order4_Inputs_Outputs.p, pwLine2.p) annotation (Line(
      points={{11,5.04964},{20,5.04964},{20,-15.6714},{32.8634,-15.6714}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={5,5})), Documentation(info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end Order4test2_AVR;

