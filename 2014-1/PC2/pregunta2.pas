program pregunta2;
var num, numAux1, numAux2,numInv,cifra1, cifra2, cantDiv, i: Integer;
    cifrasRepetidas, cifrasAsc, cifrasDes: Boolean;
    cantCifras,cantCifrasAsc,cantCifrasDes: Integer;

begin
  {Programa que verificara si un numero entero ingresado por el usuario en el rango [0, MAXINT]
   cumpla con ciertas caracteristicas}

  {Lectura de Dato}
  write('Ingrese un numero entre 0 y ',MAXINT,': ');
  readln(num);

  {Proceso}

  //Verificamos si es capicua
  numAux1 := num;
  numInv := 0;
  while numAux1<>0 do begin
    cifra1 := numAux1 mod 10;
    numInv := numInv*10 + cifra1;
    numAux1 := numAux1 div 10;
  end;
  if num=numInv then writeln('El numero ',num,' es capicua')
  else writeln('El numero ',num,' no es capicua');

  //Verificamos si tiene cifras repetidas
  numAux1 := num;
  cifrasRepetidas := FALSE;
  while not cifrasRepetidas and (numAux1 <> 0) do begin
    cifra1 := numAux1 mod 10;
    numAux2 := numAux1 div 10;
    while not cifrasRepetidas and (numAux2 <> 0) do begin
      cifra2 := numAux2 mod 10;
      if cifra1=cifra2 then cifrasRepetidas := TRUE;
      numAux2 := numAux2 div 10;
    end;
    numAux1 := numAux1 div 10;
  end;
  if cifrasRepetidas then writeln('El numero ',num,' tiene cifras repetidas')
  else writeln('El numero ',num,' no tiene cifras repetidas');


  //Verificamos si tiene cifras ascendentes o descendentes
  numAux1 := num;
  cantCifras := 0;
  cantCifrasAsc := 1;
  cantCifrasDes := 1;
  cifra2 := 0;
  while numAux1<>0 do begin
    cifra1 := numAux1 mod 10;
    inc(cantCifras);
    cantCifrasAsc := cantCifrasAsc + ord(cifra1<=cifra2)*ord(cantCifras<>1);
    cantCifrasDes := cantCifrasDes + ord(cifra1>=cifra2)*ord(cantCifras<>1);
    cifra2 := cifra1;
    numAux1 := numAux1 div 10;
  end;
  if (cantCifras=cantCifrasAsc) then writeln('El numero ',num,' tiene cifras ascendentes')
  else if (cantCifras=cantCifrasDes) then writeln('El numero ',num,' tiene cifras descendentes')
  else writeln('El numero ',num,' esta desordenado');


  //Verificamos si es un numero primo
  cantDiv := 0;
  i := 0;
  repeat
    inc(i);
    if (num mod i = 0) then inc(cantDiv);
  until (i=num) or (cantDiv>2);

  if cantDiv = 2 then writeln('El numero ',num,' es primo')
  else writeln('El numero ',num,' no es primo');

  readln;

end.
