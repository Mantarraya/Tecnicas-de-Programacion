program pregunta9;
var alpha, beta, delta: Real;
    res1, res2, res3, res4, res5, res6, res7, res8, res9, res10, res11, res12,
    res13, res14, res15, res16, res17, res18, res19, res20, res21, res22, res23,
    res24, res25, res26, res27: Real;
begin
  {Asumimos que las variables alpha y delta fueron asignadas}

  {Calculos Parciales}

  res1 := exp((beta+alpha)*ln(alpha));
  res2 := 5*alpha;
  res3 := res1 + res2;
  res4 := exp(res3*ln(beta));
  res5 := (exp(res4)+exp(-res4))/(exp(res4)-exp(-res4)); //cotanh

  res6 := 8.23 + sin(57/alpha*(pi/180))/cos(57/alpha*(pi/180));
  res7 := 2/(exp(res6)+exp(-res6)); //sech

  res8 := res5/res7; //radicando

  res9 := alpha + sqr(beta);
  res10 := (exp(beta)-exp(-beta))/2; //senh
  res11 := exp(1/res9*ln(res10)); //indice radical
  res12 := exp(1/res11*ln(res8));

  res13 := exp(alpha*ln(beta)) + alpha;
  res14 := exp(res13*ln(alpha)); //argumento de log

  res15 := 23.8 + 1/cos((beta/27.3)*(180/pi));
  res16 := res11/res15;
  res17 := exp(beta*ln(alpha));
  res18 := exp(1/res17*ln(res16)); //base de log
  res19 := ln(res14)/ln(res18); //log
  res20 := arctan(1/res19); //cotan^-1

  res21 := res20*res12; //Numerador

  res22 := 2.5*alpha + 3.9*beta;
  res23 := exp((alpha+beta)*ln(3.5));
  res24 := exp(res23*ln(res22));
  res23 := ln(res24)/ln(alpha+beta);
  res24 := res23*6.53; //Denominador

  res25 := res21/res24; //Base de la pontenciacion

  res26 := alpha + 2*beta;
  res27 := exp(1/beta*ln(res26)); //Exponente de la potenciacion

  {Calculo de delta}

  delta := exp(res27*ln(res25));

end.
