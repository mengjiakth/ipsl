within iPSL.Electrical.Branches.Eurostag;


model PwDetailedTransformer "Two winding tap changer transformer.
                  2014/03/10"
  iPSL.Connectors.PwPin p annotation (Placement(transformation(extent={{-80,-8},{-60,12}}), iconTransformation(extent={{-80,-8},{-60,12}})));
  iPSL.Connectors.PwPin n annotation (Placement(transformation(extent={{60,-8},{80,12}}), iconTransformation(extent={{60,-8},{80,12}})));
  parameter Real Snom "apparent nominal power";
  parameter Real SNREF "network base power";
  parameter Real Pcu "rated copper losses (% base tfo)";
  parameter Real Pfe "rated iron losses (% base tfo)";
  parameter Real IM "magnetizing current (noload current) (% base (Snom,V(Nnom)))";
  parameter Real ESAT=0 "exponent expressing saturation";
  parameter Real Nnom "nominal tap number";
  parameter Real Ntap "initial tap number (here tap N because taps are considered fixed)";
  //  parameter Real V1tnom "Sending side voltage for nominal tap";
  //  parameter Real V2tnom "Receiving side voltage for nominal tap";
  parameter Real V1 "Sending side voltage for tap N";
  parameter Real V2 "Receiving side voltage for tap N";
  parameter Real U1nom "Sending side Nominal Voltage";
  parameter Real U2nom "Receiving side Nominal Voltage";
  parameter Real Ucc "Leakeage impedance (% base tfo) (short-circuit voltage)";
  parameter Real theta "Phase shift angle";
  parameter Real CIM=sqrt(IM*IM - Pfe*Pfe);
  Real kr "real part of complex ratio";
  Real ki "imaginary part of complex ratio";
  Real k "module of complex ratio";
  Real k1;
  Real k2;
  Real R;
  Real X;
  Real Z;
  Real Go;
  //Real Bo;
  Real B;
  Real theta_rad;
equation
  theta_rad = theta*3.141592/180;
  k1 = V2/U2nom;
  k2 = V1/U1nom;
  k = k1/k2;
  kr = k*cos(theta_rad);
  ki = k*sin(theta_rad);
  R = Pcu*SNREF/(100*Snom);
  //R = (Pcu*SNREF*V2tnom*V2tnom) / (100*Snom*U2nom*U2nom)   Usually V2tnom = U2nom.
  Z = Ucc*SNREF/(100*Snom);
  //Z = (Ucc*SNREF*V2tnom*V2tnom) / (100*Snom*U2nom*U2nom)   Usually V2tnom = U2nom.
  if Z < 0 then
    X = -sqrt(Z*Z - R*R);
  else
    X = sqrt(Z*Z - R*R);
  end if;
  Go = Pfe*Snom/(SNREF*100);
  //B = Snom/SNREF*(CIM/100)*(U1nom/V1)^(ESAT+1)*1^(-ESAT)*(sqrt(p.vr*p.vr+p.vi*p.vi))^(ESAT-1); "If ESAT>1 use this equation"
  B = Snom/SNREF*CIM/100*(U1nom/V1)^(ESAT + 1)*1^(-ESAT) "If ESAT=1 use this equation";
  p.ir*R - p.ii*X = (-n.vi*ki) - n.vr*kr + p.vr*(kr*kr + ki*ki + k*k*Go*R + B*X) - p.vi*(k*k*Go*X - B*R);
  p.ir*X + p.ii*R = n.vr*ki - n.vi*kr + p.vr*(k*k*Go*X - B*R) + p.vi*(kr*kr + ki*ki + k*k*Go*R + B*X);
  n.ir*R - n.ii*X = n.vr - kr*p.vr + ki*p.vi;
  n.ir*X + n.ii*R = n.vi - kr*p.vi - ki*p.vr;
  annotation (
    Icon(graphics={
        Rectangle(extent={{-60,40},{60,-40}}, lineColor={0,0,255}),
        Ellipse(
          extent={{-26,16},{6,-16}},
          lineColor={0,0,255},
          lineThickness=1),
        Ellipse(
          extent={{-8,16},{24,-16}},
          lineColor={0,0,255},
          lineThickness=1),
        Line(
          points={{-42,0},{-26,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None),
        Line(
          points={{24,0},{40,0}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.None),
        Text(
          extent={{50,20},{-50,32}},
          lineColor={0,0,255},
          textString="Detailed Transformer")}),
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
end PwDetailedTransformer;
