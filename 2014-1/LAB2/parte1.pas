program parte1;
const CONV = pi/180;
var alpha, beta, delta: Real;
    res1, res2, res3, res4, res5, res6, res7, res8, res9, res10, res11, res12,
    res13, res14, res15, res16, res17, res18, res19, res20, res21, res22,
    res23, res24, res25, res26, res27, res28, res29, res30: Real;

begin

  {En el siguiente problema se tomaran como datos de entrada el valor de alpha y
   delta y se procedera a calcular el valor de delta siguiendo diversas
   operaciones matematicas}

  {Lectura de Datos}

  write('Ingrese el valor de alpha y beta: ');
  readln(alpha, beta);

  {Calculos Parciales}

  res1 := beta + alpha;
  res2 := exp(res1*ln(alpha)) + 5*alpha;
  res3 := exp(res2*ln(beta));
  res4 := (exp(res3)+exp(-res3))/(exp(res3)-exp(-res3)); // cotanh

  res5 := 57.8*CONV/alpha;
  res6 := 8.23 + sin(res5)/cos(res5);
  res7 := 2/(exp(res6)+exp(-res6)); //sech

  res8 := res4/res7; //radicando

  res9 := alpha + beta*beta;
  res10 := (exp(beta)-exp(-beta))/2;
  res11 := exp(1/res9*ln(res10)); //indice radical

  res12 := exp(1/res11*ln(res8)); //Factor

  res13 := exp(alpha*ln(beta)) + alpha;
  res14 := exp(res13*ln(alpha)); //argumento de log

  res15 := beta/(27.3*CONV);
  res16 := 23.8 + 1/cos(res15);
  res17 := res16/res11;
  res18 := exp(beta*ln(alpha));
  res19 := exp(1/res18*ln(res17)); // base de log

  res20 := ln(res14)/ln(res19);

  res21 := arctan(1/res20); //contan^-1

  res22 := res21*res12; //Numerador

  res23 := 2.5*alpha + 3.9*beta;
  res24 := exp((alpha+beta)*ln(3.5));
  res25 := exp(res24*ln(res23))*6.53; //argumento de log
  res26 := alpha + beta; //base de log
  res27 := ln(res25)/ln(res26); //Denominador

  res28 := res22/res27; //Base de la potenciacion

  res29 := alpha + 2*beta;
  res30 :=exp(1/beta*ln(res29)); //exponente de la potenciacion

  {Calculo de delta}

  delta := exp(res30*ln(res28));

  {Imprimimos delta}

  writeln('El valor de delta es: ',delta:10:6);

  {PARTE 2

   a) El error se produce en la linea 24, en la variable res4
   b) Este error se produce en el Denominador ya que por ser de tipo de dato Real
      se aplica punto flotante dandonos como una division entre cero.

   }

  readln;

end.
