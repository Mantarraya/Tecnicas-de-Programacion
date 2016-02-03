program pregunta8;
var b1, b2, v1, aux1, aux2:Byte;
begin
  {Asumimos que las variables b1 y b2 ya fueron asignadas}

  aux1 := (not b1);
  aux1 := ((aux1 shr 2) shr 2) shr 1;

  aux2 := b2 shl 1;
  aux2 := (aux2 shr 2) shr 1;

  v1 := aux1 or aux2;
end.

