program parte3;
var dd, mm, aa, ev1, ev2, ev3, ev4, ev5, num, mayor, menor: Integer;
    let1, let2, let3, carSep,cifra1, cifra2, carBisiesto,car1, car2, car3, carEsp: Char;
    nombProd: String;
    promedio : Real;
    aux1,aux2,auxV1,auxV2,auxV3,masc:Byte;
    v1, v2, v3: Byte;
begin
  randomize;

  {Lectura de Datos}

  write('Ingrese una fecha(dd mm aa): ');
  readln(dd, mm, aa);

  write('Ingrese el nombre del producto: ');
  readln(nombProd);

  write('Ingrese 5 valores enteros: ');
  readln(ev1, ev2, ev3, ev4, ev5);

  write('Ingrese 3 caracteres cualquiera: ');
  readln(car1,carEsp,car2,carEsp,car3);


  {Realizamos el Reporte}

  {Determinamos si el año es bisiesto}

  carBisiesto := char(ord('B')*ord((aa mod 400 = 0) or ((aa mod 4 = 0) and (aa mod 100 <> 0))) +
                      ord('N')*ord(aa mod 4 <> 0));


  {Generamos el codigo}

  //Primera Letra
  num := random(6);
  let1 := char(ord('A')*ord(num=0) + ord('G')*ord(num=1) + ord('M')*ord(num=2) +
               ord('N')*ord(num=3) + ord('P')*ord(num=4) + ord('V')*ord(num=5));

  //Segunda Letra
  num := ord('Z') - ord(let1);
  num := random(num)+1;
  let2 := char(ord(let1) + num);

  //Tercera Letra
  num := random (ord('Z')-ord('A')+1);
  let3 := char(ord('A')+num);

  //Caracter de Separacion
  num := random(4);
  carSep := char(ord('&')*ord(num=0) + ord('-')*ord(num=1) +
                 ord('@')*ord(num=2) + ord('~')*ord(num=3));

  //Primera Cifra
  num := random(3);
  cifra1 := char(ord('1')*ord(num=0) + ord('4')*ord(num=1) + ord('7')*ord(num=2));

  //Segunda Cifra
  num := random(4);
  cifra2 := char(ord('2')*ord(num=0) + ord('3')*ord(num=1) +
                 ord('8')*ord(num=2) + ord('0')*ord(num=3));


  {Ordenamos la evaluaciones y determinamos el promedio}

  //Aplicamos el algoritmo del metodo de ordenacion basado en Bubble Sort

  // ev1, ev2, ev3, ev4 <= v5
  mayor := ev2*ord(ev2>=ev1) + ev1*ord(ev1>ev2);
  menor := ev1 + ev2 - mayor;
  ev1 := menor;
  ev2 := mayor;

  mayor := ev3*ord(ev3>=ev2) + ev2*ord(ev2>ev3);
  menor := ev2 + ev3 - mayor;
  ev2 := menor;
  ev3 := mayor;

  mayor := ev4*ord(ev4>=ev3) + ev3*ord(ev3>ev4);
  menor := ev3 + ev4 - mayor;
  ev3 := menor;
  ev4 := mayor;

  mayor := ev5*ord(ev5>=ev4) + ev4*ord(ev4>ev5);
  menor := ev4 + ev5 - mayor;
  ev4 := menor;
  ev5 := mayor;

  // ev1, ev2, ev3 <=ev4
  mayor := ev2*ord(ev2>=ev1) + ev1*ord(ev1>ev2);
  menor := ev1 + ev2 - mayor;
  ev1 := menor;
  ev2 := mayor;

  mayor := ev3*ord(ev3>=ev2) + ev2*ord(ev2>ev3);
  menor := ev2 + ev3 - mayor;
  ev2 := menor;
  ev3 := mayor;

  mayor := ev4*ord(ev4>=ev3) + ev3*ord(ev3>ev4);
  menor := ev3 + ev4 - mayor;
  ev3 := menor;
  ev4 := mayor;

  // ev1, ev2 <=ev3
  mayor := ev2*ord(ev2>=ev1) + ev1*ord(ev1>ev2);
  menor := ev1 + ev2 - mayor;
  ev1 := menor;
  ev2 := mayor;

  mayor := ev3*ord(ev3>=ev2) + ev2*ord(ev2>ev3);
  menor := ev2 + ev3 - mayor;
  ev2 := menor;
  ev3 := mayor;

  // ev1 <= ev2
  mayor := ev2*ord(ev2>=ev1) + ev1*ord(ev1>ev2);
  menor := ev1 + ev2 - mayor;
  ev1 := menor;
  ev2 := mayor;

  promedio := (ev2 + ev3 + ev4)/3;

  {Caracteres Codificados  }
  v1 := ord(car1);
  v2 := ord(car2);
  v3 := ord(car3);

  //v1
  aux1 := (v1 shr 2)shr 1;
  aux2 := ((v3 shl 2)shl 2)shl 1;
  auxV1 := aux1 or aux2;

  //v2
  aux1 := (v2 shr 2)shr 1;
  aux2 := ((v1 shl 2)shl 2) shl 1;
  auxV2 := aux1 or aux2;

  //v3
  aux1 := (v3 shr 2)shr 1;
  aux2 :=  ((v2 shl 2)shl 2)shl 1;
  auxV3 := aux1 or aux2;

  //Creamos una mascara 00111100

  masc := 2 or 1;
  masc := masc or (masc shl 2);
  masc := masc shl 2;



  //
  //
  //
  //


  {Imprimimos Reporte}

  writeln;
  writeln('            Laboratorio 2 de Tecnicas de Programacion');
  writeln('            Resultados del programa de la parte 3');
  writeln('            Alumno: *********    Codigo: 123456789') ;
  writeln('=========================================================================');

  write('||  Fecha: ',dd,'/',mm,'/',aa);
  writeln('  (',carBisiesto,')  [ B: Bisiesto,  N: No bisiesto ]             ||');
  writeln('=========================================================================');

  write('||  Producto: ',nombProd);
  writeln('      Codigo asignado: ',let1,let2,let3,carSep,cifra1,cifra2);
  writeln('=========================================================================');

  writeln('||  Evaluaciones : ',ev1:2,' ',ev2:2,' ',ev3:2,' ',ev4:2,' ',ev5:2,'  se elimina el ',ev1,' y ',ev5,', Promedio: ',promedio:4:2);
  writeln('=========================================================================');

  write('||  Caracteres leidos: ',car1,' ',car2,' ',car3);

  write('    Caracteres codificados: ');

  readln;

end.
