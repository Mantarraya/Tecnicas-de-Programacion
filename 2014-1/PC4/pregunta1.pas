program pregunta1;
const MAX = 256;
type TArrInt = array[1..MAX] of Integer;
     TArrNum = array[1..MAX] of TArrInt;
     TArrChar = array[1..MAX] of Char;
procedure prepararArchivos(var archClave,archIn,archOut: Text);
var nombArch: String;
begin
  assign(archClave,'Clave.txt'); reset(archClave);

  write('Ingrese el nombre del archivo con el Mensaje: ');
  readln(nombArch);
  assign(archIn,nombArch); reset(archIn);

  write('Ingrese el nombre del archivo codificado: ');
  readln(nombArch);
  assign(archOut,nombArch); rewrite(archOut);
end;
procedure prepararArreglos(var archClave: Text; var arrPos,arrCantNumLinea: TArrInt;
                           var arrChar: TArrChar; var arrNum: TArrNum; var cantCar: Integer);
var cantNumLinea,i: Integer;
begin
  {Cargamos los arreglos de caracteres, numeros y la cantidad de numeros por linea}
  cantCar := 0;
  while not eof(archClave) do begin
    inc(cantCar);
    read(archClave,arrChar[cantCar]);

    cantNumLinea := 0;
    while not eoln(archClave) do begin
      inc(cantNumLinea);
      read(archClave,arrNum[cantCar][cantNumLinea]);
    end;

    arrCantNumLinea[cantCar] := cantNumLinea;

    readln(archClave);
  end;

  {Inicializamos el arreglo de Posiciones en 1}
  for i:=1 to cantCar do arrPos[i] := 1;
end;
function codificarCar(var arrPos,arrCantNumLinea: TArrInt; var arrCar: TArrChar;
                          var arrNum: TArrNum; cantCar: Integer; car: Char): Char;
var i,codAscii,pos: Integer;
    encontrado: Boolean;
begin


  {Busco el indice del caracter leido en el arreglo de caracteres}
  i:=0; encontrado := false;
  while (i<cantCar) and not encontrado do begin
    inc(i);
    encontrado := arrCar[i] = car;
  end;

  if not encontrado then codificarCar := car
  else begin

    pos := arrPos[i];
    codAscii := arrNum[i][pos];

    {Preparo la proxima posicion para el arreglo arrNum }
    inc(arrPos[i]);
    if arrPos[i]>arrCantNumLinea[i] then arrPos[i] := 1;

    codificarCar := chr(codAscii);

  end;

end;

procedure codificarArchivo(var archClave,archIn,archOut: Text);
var arrPos,arrCantNumLinea: TArrInt;
    arrCar: TArrChar;
    arrNum: TArrNum;
    cantCar: Integer;
    car: Char;
begin
  prepararArreglos(archClave,arrPos,arrCantNumLinea,arrCar,arrNum,cantCar);

  while not eof(archIn) do begin
    read(archIn,car);
    car := codificarCar(arrPos,arrCantNumLinea,arrCar,arrNum,cantCar,car);
    write(archOut,car);
  end;

end;

procedure cerrarArchivos(var archClave,archIn,archOut: Text);
begin
  close(archIn);
  close(archOut);
end;

{Programa Principal}
var archClave,archIn,archOut: Text;
begin
  prepararArchivos(archClave,archIn,archOut);
  codificarArchivo(archClave,archIn,archOut);
  cerrarArchivos(archClave,archIn,archOut);
end.

