within iPSL.Electrical.Wind.PSSE.WT1G;
model WT1G1_oneMass_nosaturation
  //Import of dependencies
  constant Real pi=Modelica.Constants.pi;
  import Complex;
  import Modelica.ComplexMath.arg;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.'abs';
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.fromPolar;
  import iPSL.NonElectrical.Functions.SE;
  //Parameters
  parameter Real eterm=1.0007 "Terminal voltage";
  parameter Real anglev0=1.6 "Power flow, node angle in degree";
  parameter Real pelec=1.5 "Active power MW";
  parameter Real qelec=-0.73 "Reactive power MVAr";
  parameter Real wbase=2*pi*60 "System base speed";
  parameter Real Mbase=1.5 "Machine base power rating MVA";
  parameter Real Sbase=100 "System base power rating MVA";
  // 'WT1G1' 1   0.84600       0.0000       3.9270      0.17730       0.0000
  //       0.10000       1.0000      0.30000E-01   1.2000      0.17900      /
  parameter Real T=0.84600 "open circuit transient time constant, sec. ( >0)";
  parameter Real X=3.9270 "synchronous reactance, pu";
  parameter Real Xp=0.17730 "transient reactance, pu";
  parameter Real Xl=0.10000 " leakage reactance";
  parameter Real E1=1 "first saturation coordinate";
  parameter Real SE1=0.30000E-01 "first saturation factor";
  parameter Real E2=1.2 "second saturation coordinate";
  parameter Real SE2=0.17900 "second saturation factor";
  parameter Real H=1;
  parameter Real wo=wbase "Synchronous speed";
  parameter Real Xs=Xl "Stator linkage reactance";
  parameter Real Xm=X - Xl "Magneticzing reactance";
  parameter Real Xr=-(Xp - Xl)*(X - Xl)/(Xp - X) "Rotor linkage reactance";
  parameter Real rr=(2*Xp - Xl - X)*(X - Xl)/((Xp - X)*(T*wo)) "Rotor resistance";
  parameter Real rs=0 "Stator resistance";
  parameter Real p0=pelec/Mbase "initial value of bus active power in p.u. machinebase";
  parameter Real q0=qelec/Mbase "initial value of bus reactive power in p.u. machinebase";
  parameter Real K1=Xr + Xm;
  parameter Real K2=(-Xs*K1) - Xr*Xm;
  parameter Real K3=Xm + Xs;
  parameter Real K4=rs*K1;
  parameter Real A=p0*(rs*rs + K3*K3) - v0*v0*rs;
  parameter Real B=2*p0*(rs*K2 + K3*K4) - v0*v0*(K2 + K1*K3);
  parameter Real C=p0*(K2*K2 + K4*K4) - v0*v0*K1*K4;
  parameter Real root=max(((-B) - sqrt(B*B - 4*A*C))/(2*A), ((-B) + sqrt(B*B - 4*A*C))/(2*A));
  parameter Real s0=rr/root;
  parameter Real T1=root*rs + K2;
  parameter Real T2=root*K3 + K4;
  parameter Real T3=T1*T1 + T2*T2;
  parameter Real Qtrue=v0*v0*(K1*T1 - root*T2)/T3 "True value of motor dynamic reactive power";
  parameter Real Qe=qelec/Mbase " Total reactive power output from power flow solution";
  parameter Real Bsh_pu=(Qe - Qtrue)/(v0*v0);
  parameter Real Qtrue_s=Qtrue*Mbase/Sbase "True value of motor dynamic reactive power";
  parameter Real Qe_s=qelec/Sbase " Total reactive power output from power flow solution";
  parameter Real Bsh_pu_s=(Qe_s - Qtrue_s)/(v0*v0) "Artificial shunt admittance corresponding to the pu mbase difference in the initial condition";
  //Initialization current and voltage components in synchronous reference frame.
  parameter Real anglev_rad=anglev0*pi/180 "initial value of bus anglev in rad";
  parameter Real v0=eterm;
  parameter Real vr0=v0*cos(anglev_rad) "Real component of initial terminal voltage";
  parameter Real vi0=v0*sin(anglev_rad) "Imaginary component of intitial terminal voltage";
  parameter Real CoB=Mbase/Sbase;
  parameter Real ir0=CoB*(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2) "Real component of initial armature current, systembase";
  parameter Real ii0=CoB*(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2) "Imaginary component of initial armature current, systembase";
  iPSL.Electrical.Wind.PSSE.WT1G.IIIorderWind iIIorderWind(
    X=X,
    Xp=Xp,
    T=T,
    p0=p0,
    q0=q0,
    S0=s0,
    v0=eterm,
    anglev0=anglev0,
    CoB=CoB) annotation (Placement(transformation(extent={{-56,6},{-36,26}})));
  iPSL.Electrical.Wind.PSSE.WT3G.shunt1 shunt1_1(v0=eterm, B=Bsh_pu_s) annotation (Placement(transformation(extent={{2,-44},{22,-24}})));
  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{84,-8},{104,12}})));
equation
  connect(iIIorderWind.p, pwPin) annotation (Line(
      points={{-37.6,16},{28,16},{28,2},{94,2}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(shunt1_1.p, pwPin) annotation (Line(
      points={{11.6,-26.4},{11.6,2},{94,2}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics), Documentation(info="<html>
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
end WT1G1_oneMass_nosaturation;

