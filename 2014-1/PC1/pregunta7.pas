program pregunta7;
var letraAleat: Char;
begin
   randomize;

   //Expresion
   letraAleat := char(random(ord('m')-ord('f')+1) + ord('f'));

   writeln(letraAleat);
   readln;
end.

