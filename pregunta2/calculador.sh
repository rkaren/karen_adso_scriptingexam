#!/bin/bash
# estudiante: karen martinez mendozao
echo "escribe 2 numeros"
read a
read b

echo "elige una opcion: "
echo "1. suma"
echo "2. resta"
echo "3. multiplicacion"
echo "4. division"
echo "5. porcentaje"
echo "6. Crea_archivo"
read ch

case $ch in
        1) res=$(($a+$b))
           h="el resultado de la suma de los operadores a y b es:"
        ;;
        2) res=$(($a-$b))
           h="el resultado de la resta de los operadores a y b :"
        ;;
        3) res=$(($a*$b))
           h="el resultado del producto de los operadores a y b :"
        ;;
        4)
	   if test $a -gt $b
		then
			mayor=$a
			menor=$b
	   fi
           if test $a -lt $b
                then
                        mayor=$b
                        menor=$a
           fi
           if test $menor -eq 0
                then
		    res=$menor
                    h="la division entre 0 no se puede"
           fi
	 if test $menor -ne 0
          then
           res=$(($a/$b))
           resto=$(($a%$b))
           h="el resultado de la division de los operadores a y b :"
         fi
           #res=$(($a/$b))
           #resto=$(($a%$b))
           #h="el resultado de la division de los operadores a y b :"
        ;;
        5) r=$(($a*$b))
          por=100
          res=$(($r/$por))
           h="el resultado a respecto a b supone un porcentaje de :"
       ;;
       6) touch archivo;;
esac

if test $ch -eq 4
then
        echo "$h: $res  y el resto es: $resto"
        let fila
        fila="$h: $res  y el resto es: $resto"
        echo $fila >>calculitos.txt
else
       echo "$h: $res"
        let filo
        filo="$h: $res"
        echo $filo >>calculitos.txt
fi

