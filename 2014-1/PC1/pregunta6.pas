program pregunta6;
//Declaracion de variales
var pc1, pc2, pc3, pc4, pc5, pcMenor, pcMayor: Integer;
    notaProm: Real;

begin
  {Primera Parte: Asignacion de las calificaciones en variables}

  {Segunda Parte: Calcular nota final}

  pcMenor := pc1*ord(pc1<pc2) + pc2*ord(pc2<=pc1);
  pcMenor := pc3*ord(pc3<pcMenor) + pcMenor*ord(pcMenor<=pc3);
  pcMenor := pc4*ord(pc4<pcMenor) + pcMenor*ord(pcMenor<=pc4);
  pcMenor := pc5*ord(pc5<pcMenor) + pcMenor*ord(pcMenor<=pc5);

  pcMayor := pc1*ord(pc1>pc2) + pc2*ord(pc2>=pc1);
  pcMayor := pc3*ord(pc3>pcMayor) + pcMayor*ord(pcMayor>=pc3);
  pcMayor := pc4*ord(pc4>pcMayor) + pcMayor*ord(pcMayor>=pc4);
  pcMayor := pc5*ord(pc5>pcMayor) + pcMayor*ord(pcMayor>=pc5);

  notaProm := (pc1+pc2+pc3+pc4+pc5-(pcMenor+pcMayor))/3;

  {Tercera Parte: Mostrar Resultados}

end.

