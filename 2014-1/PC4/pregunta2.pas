program buscaminas;
const MAX = 50;
type TFila = array[0..(MAX+1)] of Char;
     TMatriz = array[0..(MAX+1)] of TFila;
procedure inicializarTablero(var tablero: TMatriz; nFil,nCol: Integer);
var f,c: Integer;
begin
  for f:=0 to MAX+1 do
    for c:=0 to MAX+1 do
      tablero[f][c] := ' ';
end;
procedure imprimirTablero(var tablero: TMatriz; nFil,nCol: Integer);
var f,c: Integer;
begin
  for f:=1 to nFil do begin
    for c:=1 to nCol do
      write(tablero[f][c]);
    writeln;
  end;
end;
procedure insertarMinas(var tablero: TMatriz; nFil,nCol,nMin: Integer);
var cont,fil,col: Integer;
begin
  cont := 0;

  repeat

    fil := random(nFil)+1;
    col := random(nCol)+1;

    if tablero[fil][col] <> '*' then begin
      tablero[fil][col] := '*';
      inc(cont);
    end;

  until cont = nMin;
end;
function contarMinas(var tablero: TMatriz;  fil,col: Integer): Integer;
var cont,f,c: Integer;
begin
  cont := 0;

  for f:=fil-1 to fil+1 do
    for c:=col-1 to col+1 do
      if (f<>fil) or (c<>col) then
        if (tablero[f][c]='*') then
          inc(cont);
  contarMinas := cont;


end;

procedure contarNumMinasAlred(var tablero: TMatriz; nFil,nCol: Integer);
var fil,col,numMinas: Integer;
begin

  for fil:=1 to nFil do
    for col:=1 to nCol do begin

      if tablero[fil][col] <> '*' then begin

        numMinas := contarMinas(tablero,fil,col);
        if numMinas>0 then
          tablero[fil][col] := chr(numMinas+ord('0'));

      end;

    end;

end;

procedure prepararEscenario(var tablero: TMatriz; nFil,nCol,nMin: Integer);
begin
  randomize;
  inicializarTablero(tablero,nFil,nCol);
  insertarMinas(tablero,nFil,nCol,nMin);
  contarNumMinasAlred(tablero,nFil,nCol);
  imprimirTablero(tablero,nFil,nCol);
  readln;
end;

{Programa Principal}
var tablero: TMatriz;
    nFil,nCol,nMin: Integer;
begin
  write('Ingrese el numero de filas y columnas del escenario: ');
  readln(nFil,nCol);
  write('Ingrese el numero de minas: ');
  readln(nMin);
  prepararEscenario(tablero,nFil,nCol,nMin);
  //jugar(tablero,nFil,nCol,nMin);
end.

