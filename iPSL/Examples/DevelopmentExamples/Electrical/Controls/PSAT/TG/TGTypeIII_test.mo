within iPSL.Examples.DevelopmentExamples.Electrical.Controls.PSAT.TG;


model TGTypeIII_test
  iPSL.Electrical.Machines.PSAT.ThirdOrder.Order3 order3_Inputs_Outputs1(
    P_0=0.16041,
    Q_0=0.12012,
    V_b=400,
    V_0=1,
    angle_0=0,
    Sn=20,
    Vn=400,
    ra=0.001,
    xd1=0.302,
    M=10,
    D=0,
    xd=1.9,
    Td10=8,
    xq=1.7) annotation (Placement(visible=true, transformation(
        origin={-35.3443,12.6244},
        extent={{-16.6557,-16.6244},{16.6557,16.6244}},
        rotation=0)));
  iPSL.Electrical.Controls.PSAT.TG.TGTypeIII tGTypeIII1(
    Tg=0.2,
    Tp=0.04,
    delta=0.3,
    sigma=0.04,
    Tr=5,
    vmin=-0.1,
    vmax=0.1,
    gmax=1,
    gmin=0,
    Tw=1,
    a11=0.5,
    a13=1,
    a21=1.5,
    a23=1,
    int3=2.712336,
    P_0=0.1) annotation (Placement(transformation(extent={{-88,-4},{-66,14}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.001,
    offset=1,
    startTime=5,
    freqHz=0.1) annotation (Placement(transformation(extent={{-86,-36},{-72,-22}})));
  Modelica.Blocks.Sources.Sine sine1(
    amplitude=-0.001,
    startTime=10,
    offset=0,
    freqHz=0.1) annotation (Placement(transformation(extent={{-86,-60},{-72,-46}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-56,-46},{-42,-32}})));
  iPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={9.8634,12.3286},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine3(
    G=0,
    X=0.1,
    R=0.01,
    B=0.001/2) annotation (Placement(visible=true, transformation(
        origin={35.5,-14},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(visible=true, transformation(
        origin={10.863,-14.6714},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0)));
  iPSL.Electrical.Buses.InfiniteBus infiniteBus(V=1, angle=0) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={54,-14})));
  inner iPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{40,60},{82,80}})));
equation
  connect(order3_Inputs_Outputs1.vf0, order3_Inputs_Outputs1.vf)
    annotation (Line(
      points={{-48.6689,30.9112},{-12,30.9112},{-12,36},{-62,36},{-62,20.9366},{-52,20.9366}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order3_Inputs_Outputs1.w, tGTypeIII1.w) annotation (Line(
      points={{-17.023,27.5864},{-10,27.5864},{-10,-12},{-98,-12},{-98,5},{-87.78,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tGTypeIII1.Pm, order3_Inputs_Outputs1.pm) annotation (Line(
      points={{-64.46,5.36},{-61.16,5.36},{-61.16,4.3122},{-52,4.3122}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, add.u1) annotation (Line(
      points={{-71.3,-29},{-64,-29},{-64,-34.8},{-57.4,-34.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine1.y, add.u2) annotation (Line(
      points={{-71.3,-53},{-64,-53},{-64,-43.2},{-57.4,-43.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwLine2.n, pwLine1.n) annotation (Line(
      points={{16.8634,12.3286},{22,12.3286},{22,-14.6714},{17.863,-14.6714}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.n, pwLine3.p) annotation (Line(
      points={{17.863,-14.6714},{28,-14.6714},{28,-14},{28.5,-14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine3.n, infiniteBus.p) annotation (Line(
      points={{42.5,-14},{47.4,-14}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(order3_Inputs_Outputs1.p, pwLine2.p) annotation (Line(
      points={{-17.023,12.7069},{-17.5115,12.7069},{-17.5115,12.3286},{2.8634,12.3286}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine1.p, pwLine2.p) annotation (Line(
      points={{3.863,-14.6714},{-4,-14.6714},{-4,12.3286},{2.8634,12.3286}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{44,66},{80,38}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="Wref perturbation")}), Documentation(info="<html>
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
end TGTypeIII_test;
