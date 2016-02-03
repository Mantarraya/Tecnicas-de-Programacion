program pregunta1;
const MAX_CLI = 400;
      MAX_PROD = 1000;
type TArrCliInt   = array[1..MAX_CLI] of Integer;
     TArrCliStr   = array[1..MAX_CLI] of String;
     TArrProdInt  = array[1..MAX_PROD] of Integer;
     TArrProdStr  = array[1..MAX_PROD] of String;
     TArrProdReal = array[1..MAX_PROD] of Real;
procedure prepararArchivos(var archVentas,archClientes,archProductos,archBoletas: Text);
var nombArchVentas: String;
begin
  {A los archivos que no se le indiquen su nombre se le solicitara al usuario ingresarlos}

  write('Ingrese el nombre del archivo de Ventas: ');
  readln(nombArchVentas);
  assign(archVentas,nombArchVentas); reset(archVentas);

  assign(archClientes,'Clientes.txt'); rewrite(archClientes);
  assign(archProductos,'Productos.txt'); rewrite(archProductos);
  assign(archBoletas,'Boletas.txt'); rewrite(archBoletas);
end;
procedure inicializarArreglos(var arrDniCli: TArrCliInt; var arrNombCli,arrDirecCli: TArrCliStr;
                              var arrCodProd: TArrProdInt; var arrPrecioProd: TArrProdReal;
                              var arrDescripProd: TArrProdStr);
var i: Integer;
begin
  for i := 1 to MAX_CLI do begin
    arrDniCli[i] := 0;
    arrNombCli[i] := '';
    arrDirecCli[i] := '';
  end;
  for i:= 1 to MAX_PROD do begin
    arrCodProd[i] :=  0;
    arrPrecioProd[i] := 0;
    arrDescripProd[i] := '';
  end;
end;
procedure prepararArrCli(var arrDniCli: TArrCliInt;var arrNombCli,arrDirecCli: TArrCliStr; dniCli: Integer;
                         nombCli,direc: String; var cantClientes: Integer);
var i: Integer;
    encontrado: Boolean;
begin
  i := 0;
  encontrado := false;

  while (i<cantClientes) and not encontrado do begin
    inc(i);
    encontrado := arrDniCli[i] = dniCli;
  end;

  if not encontrado then begin
    inc(cantClientes);
    arrDniCli[cantClientes] := dniCli;
    arrNombCli[cantClientes] := nombCli;
    arrDirecCli[cantClientes] := direc;
  end;
end;
procedure prepararArrProd(var arrCodProd: TArrProdInt; var arrPrecioProd: TArrProdReal; var arrDescripProd: TArrProdStr;
                          codProd: Integer; precio:Real;descrip:String; var cantProductos: Integer);
var i: Integer;
    encontrado: Boolean;
begin
  i := 0; encontrado := false;

  while (i<cantProductos) and not encontrado do begin
    inc(i);
    encontrado := arrCodProd[i] = codProd;
  end;

  if not encontrado then begin
    inc(cantProductos);
    arrCodProd[cantProductos] := codProd;
    arrPrecioProd[cantProductos] := precio;
    arrDescripProd[cantProductos] := descrip;
  end;
end;
procedure imprimirArchCliYProd(var archClientes,archProductos: Text; var arrDniCli: TArrCliInt; var arrNombCli,arrDirecCli: TArrCliStr;
                               var arrCodProd: TArrProdInt; var arrDescripProd: TArrProdStr;var arrPrecioProd:TArrProdReal;
                               cantClientes,cantProductos: Integer);
var i: Integer;
begin

  for i:=1 to cantClientes do begin
    writeln(archClientes,arrDniCli[i]);
    writeln(archClientes,arrNombCli[i]);
    writeln(archClientes,arrDirecCli[i]);
  end;

  for i:= 1 to cantProductos do begin
    writeln(archProductos,arrCodProd[i]);
    writeln(archProductos,arrDescripProd[i]);
    writeln(archProductos,arrPrecioProd[i]:5:2);
  end;

end;

procedure crearArchivos(var archVentas,archClientes,archProductos,archBoletas: Text);
var cantClientes,cantProductos,numBoleta,dia,mes,anio,dniCli,codProd: Integer;
    nombCli,direc,descrip: String;
    precio,cant: Real;
    arrDniCli: TArrCliInt;
    arrNombCli,arrDirecCli: TArrCliStr;
    arrCodProd: TArrProdInt;
    arrDescripProd: TArrProdStr;
    arrPrecioProd: TArrProdReal;
begin

  inicializarArreglos(arrDniCli,arrNombCli,arrDirecCli,arrCodProd,arrPrecioProd,arrDescripProd);
  //Inicializamos variables
  cantClientes := 0;
  cantProductos := 0;

  while not eof(archVentas) do begin
    readln(archVentas,numBoleta,dia,mes,anio, dniCli);
    readln(archVentas,nombCli);
    readln(archVentas,direc);

    writeln(archBoletas,numBoleta);
    writeln(archBoletas,dia:4,mes:4,anio:8);
    writeln(archBoletas,dniCli);

    prepararArrCli(arrDniCli,arrNombCli,arrDirecCli,dniCli,nombCli,direc,cantClientes);

   repeat
     readln(archVentas,codProd);

     if codProd<>-1 then begin
       readln(archVentas,descrip);
       readln(archVentas,cant,precio); // Dejo de lado el subtotal
       writeln(archBoletas,codProd,trunc(cant):5);

       prepararArrProd(arrCodProd,arrPrecioProd,arrDescripProd,codProd,precio,descrip,cantProductos);
     end;
   until codProd=-1;

  end;

  imprimirArchCliYProd(archClientes,archProductos,arrDniCli,arrNombCli,arrDirecCli,
                       arrCodProd,arrDescripProd,arrPrecioProd,cantClientes,cantProductos);
end;
procedure cerrarArchivos(var archVentas,archClientes,archProductos,archBoletas: Text);
begin
  close(archVentas);
  close(archClientes);
  close(archProductos);
  close(archBoletas);
end;

{Programa Principal}
var archVentas,archClientes,archProductos,archBoletas: Text;
begin
  prepararArchivos(archVentas,archClientes,archProductos,archBoletas);
  crearArchivos(archVentas,archClientes,archProductos,archBoletas);
  cerrarArchivos(archVentas,archClientes,archProductos,archBoletas);
end.

