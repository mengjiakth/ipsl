within iPSL.Electrical.Wind.PSSE.WT4G;


model CCL
  parameter Real Qmax;
  parameter Integer pqflag;
  parameter Real ImaxTD "Converter current limit";
  parameter Real Iphl "Hard active current limit";
  parameter Real Iqhl "Hard reactive current limit";
  Modelica.Blocks.Interfaces.RealOutput IQmin annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-12,96}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-52,42})));
  Modelica.Blocks.Interfaces.RealInput IpCMD annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=180,
        origin={134,-20}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={55,-35})));
  Modelica.Blocks.Interfaces.RealInput IqCMD
    annotation (Placement(transformation(extent={{-146,-30},{-120,-4}}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={55,35})));
  Modelica.Blocks.Interfaces.RealOutput IQmax annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={16,96}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={2,42})));
  Modelica.Blocks.Interfaces.RealOutput IPmax annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-2,-84}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-40})));
  Modelica.Blocks.Math.Min min1 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=270,
        origin={-52,-38})));
  Modelica.Blocks.Sources.Constant const1(k=Iphl) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=270,
        origin={-9,-19})));
  Modelica.Blocks.Sources.Constant const2(k=Iqhl) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-19,23})));
  Modelica.Blocks.Math.Min min2 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-54,8})));
  Modelica.Blocks.Math.Min min3 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=270,
        origin={44,-38})));
  Modelica.Blocks.Math.Min min4 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={44,6})));
  Modelica.Blocks.Math.Min min5 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=270,
        origin={-4,8})));
  Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-83,51})));
  Modelica.Blocks.Math.Gain gain1(k=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={75,47})));
  Modelica.Blocks.Interfaces.RealInput Vt annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,78}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-101,5})));
protected
  Modelica.Blocks.Interfaces.RealInput Iqmax annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,40}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-101,5})));
protected
  Modelica.Blocks.Interfaces.RealOutput IQmin1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={44,80}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-52,42})));
  Modelica.Blocks.Interfaces.RealOutput IQmax1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={74,80}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={2,42})));
  Modelica.Blocks.Interfaces.RealOutput IQmin2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-82,80}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-52,42})));
  Modelica.Blocks.Interfaces.RealOutput IQmax2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-52,80}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={2,42})));
  Modelica.Blocks.Interfaces.RealOutput IPmax1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={44,-68}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-40})));
  Modelica.Blocks.Interfaces.RealOutput IPmax2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-52,-68}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-40})));
  Modelica.Blocks.Interfaces.RealInput Available_remain1 "sqrt(ImaxTD^2 - IpCMD^2)" annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=180,
        origin={76,-18}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={55,-35})));
  Modelica.Blocks.Interfaces.RealInput Available_remain2 "sqrt(ImaxTD^2 - IqCMD^2)" annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={-90,-20}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={55,-35})));
equation
  Available_remain1 = sqrt(ImaxTD^2 - IpCMD^2);
  Available_remain2 = sqrt(ImaxTD^2 - IqCMD^2);
  Iqmax = (Qmax - 1.6)*(Vt - 1) + Qmax;
  if pqflag == 0 then
    IQmin = IQmin2;
    IQmax = IQmax2;
    IPmax = IPmax2;
  else
    IQmin = IQmin1;
    IQmax = IQmax1;
    IPmax = IPmax1;
  end if;
  connect(const1.y, min1.u2) annotation (Line(
      points={{-9,-26.7},{-9,-30},{-48.4,-30},{-48.4,-30.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, min3.u1) annotation (Line(
      points={{-9,-26.7},{-9,-30},{40.4,-30},{40.4,-30.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, min5.u1) annotation (Line(
      points={{-11.3,23},{-7.6,23},{-7.6,15.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min5.y, min4.u2) annotation (Line(
      points={{-4,1.4},{-4,-4},{40.4,-4},{40.4,-1.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min2.u1, min5.y) annotation (Line(
      points={{-50.4,0.8},{-50.4,-4},{-4,-4},{-4,1.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min2.y, IQmax2) annotation (Line(
      points={{-54,14.6},{-52,14.6},{-52,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min1.y, IPmax2) annotation (Line(
      points={{-52,-44.6},{-52,-68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min3.y, IPmax1) annotation (Line(
      points={{44,-44.6},{44,-68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min4.y, IQmin1) annotation (Line(
      points={{44,12.6},{44,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.u, min2.y) annotation (Line(
      points={{-83,45},{-83,14.6},{-54,14.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, IQmin2) annotation (Line(
      points={{-83,56.5},{-83,65.25},{-82,65.25},{-82,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain1.y, IQmax1) annotation (Line(
      points={{75,52.5},{75,61.25},{74,61.25},{74,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain1.u, min4.y) annotation (Line(
      points={{75,41},{75,12.6},{44,12.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Iqmax, min5.u2) annotation (Line(
      points={{0,40},{0,15.2},{-0.4,15.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min4.u1, Available_remain1) annotation (Line(
      points={{47.6,-1.2},{47.6,-18},{76,-18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min3.u2, Available_remain1) annotation (Line(
      points={{47.6,-30.8},{47.6,-18},{76,-18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Available_remain2, min2.u2) annotation (Line(
      points={{-90,-20},{-57.6,-20},{-57.6,0.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(min1.u1, Available_remain2) annotation (Line(
      points={{-55.6,-30.8},{-55.6,-20},{-90,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,32},{100,-30}}, lineColor={0,0,255}),Text(
          extent={{-66,12},{60,-22}},
          lineColor={0,0,255},
          textString="Converter Current Limit
")}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-112,96},{-34,-86}},
          lineColor={255,0,0},
          pattern=LinePattern.Dot,
          lineThickness=0.5),
        Text(
          extent={{-52,90},{-40,80}},
          lineColor={255,0,0},
          pattern=LinePattern.Dot,
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Q"),
        Text(
          extent={{64,-38},{120,-62}},
          lineColor={0,0,255},
          textString="sqrt(ImaxTD^2 - IpCMD^2)"),
        Text(
          extent={{-112,-42},{-58,-58}},
          lineColor={0,0,255},
          textString="sqrt(ImaxTD^2 - IqCMD^2)")}),
    Documentation(info="<html>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
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
end CCL;
