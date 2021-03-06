within iPSL.Electrical.Branches.PSSE;


model PwTransformer "Two winding fixed transformer composed of an ideal transformer, 
  a series  impedance and a shunt admittance, with explicit equations for currents.
  2014/12/16"
  iPSL.Connectors.PwPin To annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  iPSL.Connectors.PwPin From annotation (Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  parameter Real R "Resistance To.u.";
  parameter Real X "Reactance To.u.";
  parameter Real G "Shunt conductance To.u.";
  parameter Real B "Shunt susceptance To.u.";
  parameter Real t1 "Primary winding tap ratio";
  parameter Real t2 "Secondary winding tap ratio";
  parameter Boolean PrimaryOnFromSide "Is the primary winding on the From-side?";
protected
  parameter Real t=if PrimaryOnFromSide then t1/t2 else t2/t1;
  parameter Real x=if t1 >= t2 then t2 else t1;
  parameter Real Req=R*x*x;
  parameter Real Xeq=X*x*x;
equation
  To.ir = 1/(Req*Req + Xeq*Xeq)*(Req*(t*t*To.vr - t*From.vr) + Xeq*(t*t*To.vi - t*From.vi));
  To.ii = 1/(Req*Req + Xeq*Xeq)*(Req*(t*t*To.vi - t*From.vi) - Xeq*(t*t*To.vr - t*From.vr));
  From.ir = (-1/t*(1/(Req*Req + Xeq*Xeq)*(Req*(t*t*To.vr - t*From.vr) + Xeq*(t*t*To.vi - t*From.vi)))) + G*From.vr - B*From.vi;
  From.ii = (-1/t*(1/(Req*Req + Xeq*Xeq)*(Req*(t*t*To.vi - t*From.vi) - Xeq*(t*t*To.vr - t*From.vr)))) + G*From.vi + B*From.vr;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-60,40},{60,-40}}, lineColor={0,0,255}),
        Ellipse(
          extent={{-28,22},{14,-22}},
          lineColor={0,0,255},
          lineThickness=1),
        Line(
          points={{-60,0},{-28,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None),
        Line(
          points={{28,0},{60,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None),
        Text(
          extent={{-94,34},{-62,14}},
          lineColor={0,0,255},
          textString="From"),
        Text(
          extent={{62,34},{94,14}},
          lineColor={0,0,255},
          textString="To"),
        Ellipse(
          extent={{-14,22},{28,-22}},
          lineColor={0,0,255},
          lineThickness=1)}),
    Diagram(graphics),
    Documentation(info="<html>
Transformer model from Nordic44 system developed by Giuseppe. 
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
end PwTransformer;
