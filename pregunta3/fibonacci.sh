#!/bin/bash
#estudiante:Karen Martinez
#fibonacci
fibonacci() {
#       a=0
#       b=1
        i=0
        echo "Dime el primer elemento"
        read a
        echo "Dime el segundo elemento"
        read b
        #verifico si mayor y menor
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
        #si i menor que lo q ingresa por prompt sino dijera que es 20 pondria $1 que es lo q lee en prompt
       while [ $i -lt 20 ]
        do
                printf "%d\n" $menor
                let sum=$menor+$mayor
                let menor=$mayor
                let mayor=$sum
                let i=$i+1
        done
}
#echo "Longitud: "
#read longitud
fibonacci $longitud

