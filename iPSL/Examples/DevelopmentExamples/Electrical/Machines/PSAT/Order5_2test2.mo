within iPSL.Examples.DevelopmentExamples.Electrical.Machines.PSAT;
model Order5_2test2
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ2(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={13.2834,10},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLinewithOpeningReceiving pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=8,
    t2=8.1) annotation (Placement(visible=true, transformation(
        origin={-25,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-25,15},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-20,-35},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Loads.PSAT.LOADPQ pwLoadPQ1(
    P_0=0.08,
    Q_0=0.06,
    V_0=1,
    angle_0=0) annotation (Placement(visible=true, transformation(
        origin={20,-35},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-60,10},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={-60,-5},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Events.PwFault pwFault(
    X=0.001,
    t1=3,
    t2=3.1,
    R=10) annotation (Placement(transformation(extent={{0,-65},{20,-45}})));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{0,80},{25,100}})));
  iPSL.Electrical.Machines.PSAT.FifthOrder.Order5_Type2 order5Type2_Inputs_Outputs(
    V_b=200,
    P_0=0.160352698692006,
    Q_0=0.11859436505981,
    Sn=370,
    Vn=200,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0) annotation (Placement(transformation(extent={{-115,-5},{-95,15}})));
equation
  connect(pwLine4.n, pwLoadPQ2.p) annotation (Line(
      visible=true,
      origin={-2.7875,13},
      points={{-15.2125,2},{3.0708,2},{3.0708,8},{16.0709,8}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
      visible=true,
      origin={-18,7.5},
      points={{0,-7.5},{0,7.5}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
      visible=true,
      origin={-32,7.5},
      points={{0,7.5},{0,-7.5}}));
  connect(pwLine3.n, pwLoadPQ1.p) annotation (Line(
      visible=true,
      origin={3.5,-34.5},
      points={{-16.5,-0.5},{3.5,-0.5},{3.5,10.5},{16.5,10.5}}));
  connect(pwLine1.p, pwLine2.p) annotation (Line(
      points={{-67,-5},{-67,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, pwLine2.n) annotation (Line(
      points={{-53,-5},{-53,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine2.n, pwLine4.p) annotation (Line(
      points={{-53,10},{-40,10},{-40,15},{-32,15}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, pwLine3.p) annotation (Line(
      points={{-53,-5},{-40,-5},{-40,-35},{-27,-35}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, pwLine3.n) annotation (Line(
      points={{-1.66667,-55},{-1.66667,-44.5},{-13,-44.5},{-13,-35}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(order5Type2_Inputs_Outputs.pm, order5Type2_Inputs_Outputs.pm0) annotation (Line(points={{-115,0},{-120,0},{-120,-10},{-113,-10},{-113,-6}}, color={0,0,127}));
  connect(order5Type2_Inputs_Outputs.vf, order5Type2_Inputs_Outputs.vf0) annotation (Line(points={{-115,10},{-120,10},{-120,20},{-113,20},{-113,16}}, color={0,0,127}));
  connect(order5Type2_Inputs_Outputs.p, pwLine2.p) annotation (Line(points={{-94,5.04964},{-80,5.04964},{-80,10},{-67,10}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=false,
        initialScale=0.1,
        grid={5,5}), graphics={Text(
          visible=true,
          origin={-60,54.1417},
          fillPattern=FillPattern.Solid,
          extent={{-35.0,-5.8583},{35.0,5.8583}},
          textString="SystemSbase=100 MVA",
          fontName="Arial")}),
    experiment(StopTime=20),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
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
end Order5_2test2;

