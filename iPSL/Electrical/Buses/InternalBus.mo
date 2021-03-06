within iPSL.Electrical.Buses;
model InternalBus "Bus for change base"
  constant Real pi=Modelica.Constants.pi;
  parameter Real M_b=120 "System base power rating (MVA)" annotation (Dialog(group="Power flow data"));
  parameter Real S_b=1000 "System base power rating (MVA)" annotation (Dialog(group="Power flow data"));
  iPSL.Connectors.PwPin p "Machine base" annotation (Placement(transformation(extent={{-32,-4},{-12,16}}), iconTransformation(extent={{-32,-4},{-12,16}})));
  iPSL.Connectors.PwPin n "System base" annotation (Placement(transformation(extent={{8,-4},{28,16}}), iconTransformation(extent={{8,-4},{28,16}})));
protected
  parameter Real CoB=M_b/S_b;
equation
  0 = n.vr - p.vr;
  0 = n.vi - p.vi;
  0 = p.ir*CoB + n.ir;
  0 = p.ii*CoB + n.ii;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{8,96},{-12,-88}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Text(
          extent={{-46,34},{-22,2}},
          lineColor={0,0,255},
          textString="*")}),
    Diagram(graphics),
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
end InternalBus;

