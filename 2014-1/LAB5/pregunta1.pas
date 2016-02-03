program pregunta1;
type TArrChr = array[1..255] of Char;
     TArrInt = array[1..10] of Integer;
procedure prepararArchivos(var archTexto,archClave: Text);
var nombArch: String;
begin
  write('Ingrese el nombre del archivo para generar la clave: ');
  readln(nombArch);
  assign(archTexto,nombArch); reset(archTexto);

  write('Ingrese el nombre del archivo Clave a crear: ');
  readln(nombArch);
  assign(archClave,nombArch); rewrite(archClave);
end;
procedure insertarCarArreglo(var arrCar: TArrChr; car: Char; var cantCar: Integer);
var i: Integer;
    encontrado: Boolean;
begin
  i := 0;    encontrado := false;

  while (i<cantCar) and not encontrado do begin
    inc(i);
    encontrado := arrCar[i] = car;
  end;

  if not encontrado then begin
    inc(cantCar);
    arrCar[cantCar] := car;
  end;
end;
procedure desordenarArrCar(var arrCar: TArrChr; cantCar: Integer);
var limite,pos: Integer;
    aux: Char;
begin
  randomize;

   for limite := cantCar downto 2 do begin
     pos := random(limite) + 1;
     aux := arrCar[limite];
     arrCar[limite] := arrCar[pos];
     arrCar[pos] := aux;
   end;
end;

procedure prepararArregloCar(var archTexto: Text; var arrCar: TArrChr; var cantCar: Integer);
var car: Char;
begin
  cantCar := 0;
  while not eof(archTexto) do begin
    read(archTexto,car);
    insertarCarArreglo(arrCar,car,cantCar);
  end;
  desordenarArrCar(arrCar,cantCar);
end;
procedure insertarNumArreglo(var arrNum: TArrInt; num: Integer; var cantNum: Integer);
var i: Integer;
    encontrado: Boolean;
begin
  i := 0;    encontrado := false;

  while (i<cantNum) and not encontrado do begin
    inc(i);
    encontrado := arrNum[i] = num;
  end;

  if not encontrado then begin
    inc(cantNum);
    arrNum[cantNum] := num;
  end;
end;

procedure prepararArregloNum(var arrNum: TArrInt; var cantNum: Integer; limSup: Integer);
var r,num: Integer;
begin

  randomize;

  r := random(10) + 3; // [3,12]

  cantNum := 0;
  repeat
    num := random(limSup-2+1)+2;
    insertarNumArreglo(arrNum,num,cantNum);
  until cantNum=r;
end;
procedure crearArchClave(var archClave: Text; var arrCar: TArrChr; var arrNum: TArrInt;
                         cantCar,cantNum: Integer);
var i: Integer;
begin
  for i := 1 to cantCar do write(archClave,arrCar[i]);
  writeln(archClave);
  for i := 1 to cantNum do write(archClave,arrNum[i]:3);
end;

procedure generarArchClave(var archTexto,archClave: Text);
var arrCar: TArrChr;
    arrNum: TArrInt;
    cantCar,cantNum: Integer;
begin
  prepararArregloCar(archTexto,arrCar,cantCar);
  prepararArregloNum(arrNum,cantNum,cantCar-2);
  crearArchClave(archClave,arrCar,arrNum,cantCar,cantNum);
end;

procedure cerrarArchivos(var archTexto,archClave: Text);
begin
  close(archTexto);
  close(archClave);
end;
{Programa Principal}
var archTexto,archClave: Text;
begin
  prepararArchivos(archTexto,archClave);
  generarArchClave(archTexto,archClave);
  cerrarArchivos(archTexto,archClave);
end.
