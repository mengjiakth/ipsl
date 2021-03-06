within iPSL.NonElectrical.Continuous;


class LeadLagLim "Lead-Lag filter with a non-windup limiter"
  extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));
  parameter Real K "Gain" annotation (Evaluate=false);
  parameter Real T1 "Lead time constant" annotation (Evaluate=false);
  parameter Real T2 "Lag time constant" annotation (Evaluate=false);
  parameter Real y_start "Output start value" annotation (Dialog(group="Initialization"));
  parameter Real outMax "Maximum output value" annotation (Evaluate=false);
  parameter Real outMin "Minimum output value" annotation (Evaluate=false);
  Real s(start=y_start) "State variable";
equation
  assert(
    abs(T1) >= 1e-10 and abs(T2) >= 1e-10,
    "Time constants must be greater than zero",
    AssertionLevel.error);
  assert(
    outMax > outMin,
    "Upper limit must be greater than lower limit",
    AssertionLevel.error);
  if y > outMax then
    der(s) = 0;
    y = outMax;
  elseif y < outMin then
    der(s) = 0;
    y = outMin;
  else
    T2*der(s) = (-s) + K*u;
    T2*y = ((-s) + K*u)*T1 + T2*s;
  end if;
  annotation (
    Icon(graphics={
        Line(points={{38,100},{58,140},{98,140}}, color={0,0,0}),
        Line(points={{-102,-140},{-62,-140},{-42,-100}}, color={0,0,0}),
        Text(
          extent={{-50,82},{70,22}},
          lineColor={0,0,255},
          textString="1+sT"),
        Text(
          extent={{56,44},{76,24}},
          lineColor={0,0,255},
          textString="1"),
        Line(
          points={{-52,0},{76,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),
        Text(
          extent={{-50,-20},{70,-80}},
          lineColor={0,0,255},
          textString="1+sT"),
        Text(
          extent={{58,-58},{78,-78}},
          lineColor={0,0,255},
          textString="2"),
        Text(
          extent={{-106,28},{-46,-32}},
          lineColor={0,0,255},
          textString="K")}),
    Diagram,
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
end LeadLagLim;
