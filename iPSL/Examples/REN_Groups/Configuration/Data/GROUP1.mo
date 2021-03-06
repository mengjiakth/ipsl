within iPSL.Examples.REN_Groups.Configuration.Data;
record GROUP1
  extends Modelica.Icons.Record;
  replaceable record GENROU_N44 = iPSL.Examples.REN_Groups.Configuration.Data.GENROU_data annotation (choicesAllMatching);
  GENROU_N44 genrou;
  replaceable record IEEET2_N44 = iPSL.Examples.REN_Groups.Configuration.Data.IEEET2_data annotation (choicesAllMatching);
  IEEET2_N44 ieeet2;
  replaceable record STAB2A_N44 = iPSL.Examples.REN_Groups.Configuration.Data.STAB2A_data annotation (choicesAllMatching);
  STAB2A_N44 stab2a;
  replaceable record IEESGO_N44 = iPSL.Examples.REN_Groups.Configuration.Data.IEESGO_data annotation (choicesAllMatching);
  IEESGO_N44 ieesgo;
  replaceable record INI_GEN_N44 = iPSL.Examples.REN_Groups.Configuration.Data.INI_GENROU_data annotation (choicesAllMatching);
  INI_GEN_N44 ini_gen;
  annotation (
    Icon(graphics={
        Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}),
        Text(
          extent={{-32,14},{32,-10}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="|x|"),
        Text(
          extent={{-58,4},{-46,-4}},
          lineColor={255,255,255},
          textString="p1")}),
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
end GROUP1;

