program pregunta1;
const TURNO_MANANA_INICIO = 8*3600 + 30*60; TURNO_MANANA_FIN = 11*3600 + 30*60;
      TURNO_TARDE_INICIO = 13*3600 + 30*60; TURNO_TARDE_FIN = 16*3600 + 30*60;
      TURNO_NOCHE_INICIO = 17*3600 + 30*60; TURNO_NOCHE_FIN = 22*3600 + 00*60;
var dd,mm,aa,dd1,mm1,aa1,dd2,mm2,aa2: Integer;
    hhIng, mmIng, ssIng, hhSal, mmSal, ssSal: Integer;
    cantAlumnos, cantAlumM,cantAlumF,cantAlumTurnoM,cantAlumTurnoT,cantAlumTurnoN:Integer;
    tiempoSal,tiempoIng,tiempoAlum,tiempoAlumM,tiempoAlumF,tiempoTotalEntreFechas: Integer;
    tiempoMayorM,tiempoMayorF,cantAlumMMenos20,cantAlumMMas90,cantAlumFMenos20,cantAlumFMas90: Integer;
    nombArchAsesorias,nombAlumno,nombAlumMayorM,nombAlumMayorF,motivo: String;
    genero:Char;
    archAsesorias: Text;
begin
  {Programa leera varios datos de un archivo de texto del cual determinara
   la frecuencia de la asistencia de los alumnos en las asesorias}

  {Ingresamos dos fechas y verificamos que la primera fecha sea menor que la
   segunda}

  writeln('INGRESE 2 FECHAS, LA PRIMERA DEBE SER MENOR QUE LA SEGUNDA');
  repeat
    write('Fecha 1 (dd mm aa): '); readln(dd1, mm1, aa1);
    write('Fecha 2 (dd mm aa): '); readln(dd2, mm2, aa2);
    if (aa2*10000 + mm2*100 + dd2) < (aa1*10000 + mm1*100 + dd1) then
      writeln('LA PRIMERA FECHA NO ES MENOR QUE LA SEGUNDA');
  until (aa2*10000 + mm2*100 + dd2)>(aa1*10000 + mm1*100 + dd1);

  {Preparamos el archivo con los datos de la asesoria}

  write('Ingrese el nombre del archivo de las Asesorias: ');
  readln(nombArchAsesorias);
  assign(archAsesorias,nombArchAsesorias);
  reset(archAsesorias);

  {Determinamos las diversas frecuencias de la asistencias de los alumnos y/o
   alumnas que van a las asesorías}

  cantAlumnos := 0; cantAlumTurnoM := 0; cantAlumTurnoT := 0; cantAlumTurnoN := 0;
  cantAlumMMas90 := 0; cantAlumMMenos20 := 0; cantAlumFMas90 := 0; cantAlumFMenos20 := 0;
  tiempoTotalEntreFechas := 0; cantAlumM := 0; cantAlumF := 0;
  tiempoMayorM := 0; tiempoMayorF := 0;
  readln(archAsesorias, nombAlumno);
  while (nombAlumno<>'fin') do begin
    readln(archAsesorias,genero, dd, mm, aa, hhIng, mmIng, ssIng, hhSal, mmSal, ssSal, motivo);

    inc(cantAlumnos); //Aqui guardaremos la cantidad total de alumnos

    //Tiempo en segundos
    tiempoSal := hhSal*3600 + mmSal*60 + ssSal;
    tiempoIng := hhIng*3600 + mmIng*60 + ssIng;
    tiempoAlum := tiempoSal -  tiempoIng;

    {Verificamos si la fecha de la asesoria esta en el rango de las fechas
     ingresadas inicialmente}

    if ((aa2*10000+mm2*100+dd2)>=(aa*10000+mm*100+dd)) and ((aa1*10000+mm1*100+dd1)<=(aa*10000+mm*100+dd)) then
      tiempoTotalEntreFechas := tiempoTotalEntreFechas + tiempoAlum;

    {Determinamos la cantidad de alumnos que asisten en los turnos mañana,
     tarde y noche}

    if (TURNO_MANANA_INICIO<=tiempoIng) and (TURNO_MANANA_FIN>=tiempoSal) then inc(cantAlumTurnoM)
    else if (TURNO_TARDE_INICIO<=tiempoIng) and (TURNO_TARDE_FIN>=tiempoSal) then inc(cantAlumTurnoT)
    else if (TURNO_NOCHE_INICIO<=tiempoIng) and (TURNO_NOCHE_FIN>=tiempoSal) then inc(cantAlumTurnoN);

    {Genero M}
    if (genero = 'M') then begin
      inc(cantAlumM);
      tiempoAlumM := tiempoAlumM + tiempoAlum; // Acumulamos el tiempo de los alumnos (M)

      //Nombre del alumno (M) que se quedo mas tiempo en la asesoria
      if (tiempoAlum>=tiempoMayorM) then begin
        tiempoMayorM := tiempoAlumM;
        nombAlumMayorM := nombAlumno;
      end;

      //Cantidad de Alumnos (M) que permanecen menos de 20 minutos o mas de 1 hora y 30 minutos en las asesorias
      if (tiempoAlum < 20*60) then inc(cantAlumMMenos20)
      else if (tiempoAlum > (1*3600 + 30*60)) then inc(cantAlumMMas90);

    end
    else begin {Genero F}
      inc(cantAlumF);
      tiempoAlumF := tiempoAlumF + tiempoAlum; // Acumulamos el tiempo de los alumnas (F)

      //Nombre de la alumna (F) que se quedo mas tiempo en la asesoria
      if (tiempoAlum>=tiempoMayorF) then begin
        tiempoMayorF := tiempoAlumF;
        nombAlumMayorF := nombAlumno;
      end;

      //Cantidad de Alumnas (F) que permanecen menos de 20 minutos o mas de 1 hora y 30 minutos en las asesorias
      if (tiempoAlum < 20*60) then inc(cantAlumFMenos20)
      else if (tiempoAlum > (1*3600 + 30*60)) then inc(cantAlumFMas90);
    end;
    readln(archAsesorias, nombAlumno);
  end;

  close(archAsesorias); //Cerramos el archivo de Asesorias

  {Imprimimos resultados}

  writeln;
  writeln('El tiempo promedio en horas, minutos y segundos: ');

  tiempoAlum := tiempoAlumM div cantAlumM;
  hhIng := tiempoAlum div 3600;
  mmIng := (tiempoAlum mod 3600) div 60;
  ssIng := (tiempoAlum mod 3600) mod 60;

  writeln('Alumnos (M): ',hhIng,'h ', mmIng,'m ',ssIng,'s');

  tiempoAlum := tiempoAlumF div cantAlumF;
  hhIng := tiempoAlum div 3600;
  mmIng := (tiempoAlum mod 3600) div 60;
  ssIng := (tiempoAlum mod 3600) mod 60;

  writeln('Alumnas (F): ',hhIng,'h ', mmIng,'m ',ssIng,'s');

  writeln('Cantidad de Alumnos (M y F): ',cantAlumnos);

  hhIng := tiempoTotalEntreFechas div 3600;
  mmIng := (tiempoTotalEntreFechas mod 3600) div 60;
  ssIng := (tiempoTotalEntreFechas mod 3600) mod 60;
  writeln('Tiempo Total entre las fechas ingresadas: ',hhIng,'h ', mmIng,'m ',ssIng,'s');

  writeln('Alumno (M) que paso mayor tiempo en las asesorias: ',nombAlumMayorM);
  writeln('Alumna (F) que paso mayor tiempo en las asesorias: ',nombAlumMayorF);

  writeln('Porcentaje de alumnos (M y F) que asistieron en los turnos: ');
  writeln('Turno Manana: ',(cantAlumTurnoM*100/cantAlumnos):5:2,'%');
  writeln('Turno Tarde: ',(cantAlumTurnoT*100/cantAlumnos):5:2,'%');
  writeln('Turno Noche: ',(cantAlumTurnoN*100/cantAlumnos):5:2,'%');

  writeln('Cantidad de Alumnos que permanecieron menos de 20 minutos: ');
  writeln('Alumnos (M): ',cantAlumMMenos20);
  writeln('Alumnas (F): ',cantAlumFMenos20);
  writeln('Cantidad de Alumnos que permanecieron mas de 1 hora y media : ');
  writeln('Alumnos (M): ',cantAlumMMas90);
  writeln('Alumnas (F): ',cantAlumFMas90);

  readln;
end.
