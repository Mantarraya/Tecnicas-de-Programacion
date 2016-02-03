program pregunta2;
const MAX_CANT_NUM = 10;
    MAX_CANT_CAR = 255;
type TArrChr = array[1..MAX_CANT_CAR] of Char;
     TArrInt = array[1..MAX_CANT_NUM] of Integer;
procedure prepararArchivos(var archClave,archMensaje,archMensajeCifrado: Text);
var nombArch: String;
begin
  write('Ingrese el nombre del archivo Clave: ');
  readln(nombArch);
  assign(archClave,nombArch); reset(archClave);

  write('Ingrese el nombre del archivo con el Mensaje: ');
  readln(nombArch);
  assign(archMensaje,nombArch); reset(archMensaje);

  write('Ingrese el nombre del archivo con el Mensaje Cifrado: ');
  readln(nombArch);
  assign(archMensajeCifrado,nombArch); rewrite(archMensajeCifrado);
end;
procedure prepararArreglosClave(var archClave: Text; var arrOrigCar,arrNuevoCar: TArrChr;
                                var arrNum: TArrInt; var cantCar,cantNum: Integer);
var car: Char;
begin

  {Inicializo variables}
  cantCar := 0;     cantNum := 0;
  while not eoln(archClave) do begin
    inc(cantCar);
    read(archClave,car);
    arrNuevoCar[cantCar] := car; arrOrigCar[cantCar] := car;
  end;

  readln(archClave);

  while not eof(archClave) do begin
    inc(cantNum);
    read(archClave,arrNum[cantNum]);
  end;
end;
procedure rotarArreglo(var arrNuevoCar: TArrChr; cantCar,pos: Integer);
var arrAuxCar: TArrChr;
    i,n: Integer;
begin
  //Creamos un arreglo auxiliar
  for i:=1 to cantCar do arrAuxCar[i] := arrNuevoCar[i];

  n := 0;
  for i:=pos to cantCar do begin
    inc(n);
    arrNuevoCar[n] := arrAuxCar[i];
  end;

  for i:= 1 to pos-1 do begin
    inc(n);
    arrNuevoCar[n] := arrAuxCar[i];
  end;
end;

procedure cifrarCaracter(var arrOrigCar,arrNuevoCar: TArrChr; var arrNum: TArrInt;
                         var car: Char; var cont: Integer; cantCar,cantNum: Integer);
var pos,i: Integer;
    encontrado: Boolean;
begin

  if cont>cantNum then cont := 1;

  pos := arrNum[cont];

  rotarArreglo(arrNuevoCar,cantCar,pos);

  //Buscamos el caracter leido en el arreglo original de caracteres
  encontrado := false;  i := 0;

  while (i<cantCar) and not encontrado do begin
    inc(i);
    encontrado := arrOrigCar[i] = car;
  end;

  if encontrado then car := arrNuevoCar[i];

end;

procedure cifrarArchMensaje(var archClave,archMensaje,archMensajeCifrado: Text);
var arrOrigCar,arrNuevoCar: TArrChr;
    arrNum: TArrInt;
    car: Char;
    cantNum,cantCar,cont: Integer;
begin
  prepararArreglosClave(archClave,arrOrigCar,arrNuevoCar,arrNum,cantCar,cantNum);

  cont := 0;
  while not eof(archMensaje) do begin
    inc(cont); // Manejara las posiciones del arreglo arrNum
    read(archMensaje,car);
    cifrarCaracter(arrOrigCar,arrNuevoCar,arrNum,car,cont,cantCar,cantNum);
    write(archMensajeCifrado,car);
  end;

end;

procedure cerrarArchivos(var archClave,archMensaje,archMensajeCifrado: Text);
begin
  close(archClave);
  close(archMensaje);
  close(archMensajeCifrado);
end;

{Programa Principal}
var archClave,archMensaje,archMensajeCifrado: Text;
begin
  prepararArchivos(archClave,archMensaje,archMensajeCifrado);
  cifrarArchMensaje(archClave,archMensaje,archMensajeCifrado);
  cerrarArchivos(archClave,archMensaje,archMensajeCifrado);
end.

