within iPSL.Examples.N44_Groups.Configuration;
model Group3 "Machine configuration of synchronous machine with regulators: GENSAL, HYGOV, SCRX, STAB2A; 
  from Nordic 44 model: Buses 3115, 5300, 6100, 6700, 7100.
  Configuration from Bus 6700"
  Electrical.Machines.PSSE.GENSAL.GENSAL gENSAL(
    V_0=1.02 "power flow, terminal voltage",
    angle_0=34.81 "power flow, angle in degree",
    P_0=600 "power flow, active power, (MW)",
    Q_0=19.7935 "power flow, reactive power, (Mvar)",
    M_b=1200 "system base power rating (MVA)",
    Tpd0=5.24 "T'do (> 0)",
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    H=3.592 "Inertia",
    D=0 "Speed Damping",
    Xd=1.1044 "d-axis reactance",
    Xq=0.6619 "q-axis reactance",
    Xpd=0.2548 "d-axis transient reactance",
    Xppd=0.1706 "d-axis subtransient reactance",
    Xppq=0.1706 "q-axis subtransient reactance",
    Xl=0.1474 "leakage reactance",
    S10=0.1,
    S12=0.3,
    S_b=1000) annotation (Placement(transformation(extent={{-56,-22},{-4,32}})));
  Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop (pu)",
    r=0.4 "Temporary droop (pu)",
    T_r=5 "Governor time constant, s",
    T_f=0.05 "Filter time constant, s",
    T_g=0.2 "Servo time constant, s",
    VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
    G_MAX=1 "Maximum gate limit (pu)",
    G_MIN=0 "Minimum gate limit (pu)",
    T_w=1 "Water time constant, s",
    A_t=1.1 "Turbine gain (pu)",
    D_turb=0.5 "Turbine damping (pu)",
    q_NL=0.1 "Water flow at no load. p.u") annotation (Placement(transformation(extent={{-104,6},{-48,34}})));
  Electrical.Controls.PSSE.ES.SCRX.SCRX sCRX(
    V_c0=1 "initial value of ECOMP",
    V_0=1 "initial value of ETERM",
    T_AT_B=0.2539 "TA/TB",
    T_B=13 "TB (sec)",
    K=61 "K",
    T_E=0.05 "TE (sec)",
    E_MIN=0 "EMIN (pu on EFD base)",
    E_MAX=4 "EMAX (pu on EFD base)",
    r_cr_fd=0 "rc/rfd",
    C_SWITCH=false) annotation (Placement(transformation(extent={{-94,-20},{-60,6}})));
  Modelica.Blocks.Sources.Constant cte(k=0) annotation (Placement(transformation(extent={{-119,-21},{-109,-11}})));
  Electrical.Controls.PSSE.PSS.STAB2A.STAB2A sTAB2A(
    K_2=1 "fraction ",
    T_2=4.5 "controller lead compensation (s)",
    K_3=0 "fraction ",
    T_3=2 "governor lag (s)",
    K_4=0.55,
    K_5=1,
    T_5=0.01,
    H_LIM=0.03) annotation (Placement(transformation(extent={{-136,-12},{-106,8}})));
  Connectors.PwPin p annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(
      points={{-46.6,20},{-55.9,20},{-55.9,18.5},{-55.48,18.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(
      points={{-1.92,29.3},{-6,29.3},{-6,40},{-102,40},{-102,27},{-103.3,27}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(
      points={{-1.92,-3.1},{-4,-3.1},{-4,44},{-104,44},{-104,13},{-103.3,13}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sCRX.VOEL) annotation (Line(
      points={{-108.5,-16},{-100,-16},{-100,-2.45},{-93.8583,-2.45}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cte.y, sCRX.VUEL) annotation (Line(
      points={{-108.5,-16},{-100,-16},{-100,-5.83},{-93.8583,-5.83}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(
      points={{-1.92,-13.9},{-6,-13.9},{-6,-30},{-92,-30},{-92,-17.53},{-93.8583,-17.53}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(
      points={{-59.4333,-6.87},{-58,-6.87},{-58,-8.5},{-55.48,-8.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.ETERM, sCRX.ETERM) annotation (Line(
      points={{-1.92,18.5},{-10,18.5},{-10,-34},{-94,-34},{-94,-12.98},{-94.1417,-12.98}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(
      points={{-1.92,-19.3},{-1.92,-38},{-96,-38},{-96,-8.69},{-94.1417,-8.69}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.ECOMP, sCRX.ETERM)
    annotation (Line(
      points={{-93.8583,4.31},{-106,4.31},{-106,46},{0,46},{0,18},{-10,18},{-10,-34},{-94,-34},{-94,-12.98},{-94.1417,-12.98}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(
      points={{-104.636,-2},{-100,-2},{-100,0.67},{-93.8583,0.67}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PELEC, sTAB2A.PELEC) annotation (Line(
      points={{-1.92,-8.5},{4,-8.5},{4,50},{-140,50},{-140,-2},{-135.591,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(p, gENSAL.p) annotation (Line(points={{110,0},{44,0},{44,5},{-1.4,5}}, color={0,0,255}));
  annotation (Icon(graphics={
        Ellipse(extent={{-14,-42},{74,38}}, lineColor={0,0,255}),
        Line(
          points={{-2,-12},{18,8},{38,-12},{58,8}},
          color={0,0,255},
          smooth=Smooth.None),
        Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),
        Text(
          extent={{-91,6},{-22,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString="GENSAL & 
STAB2A &
SCRX & 
HYGOV")}), Documentation(info="<html>
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
end Group3;

