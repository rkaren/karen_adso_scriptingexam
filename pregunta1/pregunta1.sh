!/bin/bash
#Estudiante:Karen Martinez

#OUTPUT="/tmp/calc.tmp"
#OUTPUT2="/tmp/calc2.tmp"

#variables globales
let adaptador

#FUNCIONES
#FUNCION SUMA
function_suma(){
    rm /tmp/calc.tmp
    rm /tmp/calc2.tmp
    # Dibuja funcion suma
    dialog --inputbox "Indica el primer numero" 0 0 2>$OUTPUT
    # lee lo que  escribe Y ASIGNA A 
    n1=$(<$OUTPUT)
    dialog --inputbox "Indica el segundo numero" 0 0 2>$OUTPUT2
    n2=$(<$OUTPUT2)
    result=$((n1+n2))
    dialog --msgbox  "result: "$result 0 0
}
#funcion para ingresar adapatador de red
function_adaptador(){
    OUTPUT="/tmp/input.txt"
    dialog --inputbox "Indica el adaptador" 0 0 2>$OUTPUT
 # lee lo que está escribiendo el usuario
    respose=$?
    # lee lo que hay en OUTPUT  y lo redirige
    name=$(<$OUTPUT)
    # Entra en el case
    case $respose in
      0) echo "hola $name" ;;
      1) echo "Cancel pressed." ;;
      255) echo "[ESC] key pressed."
    esac
    rm /tmp/input.txt
    #lo asignamos a variable global
    adaptador=$name
}
function_crear(){
   # variuablke q almacaena cada fila del formato de interfcaes
    let fila
    #leemos las variables globales almacanedas en acda funcion
    #cat $adaptador #cat direccion cat puerta cat mascara cat broadcast cat dns1 cat dns2
    # empezamos el dibujo del a estructura del fichero inetrfaces
    fila= "source /etc/network/interfaces.d/*"   
    echo $fila >>interfaces.txt
    fila="auto $adaptador"
    #lo redireccionamos interfaces .txt(no es .txt en realidad solo para este examen)
    echo $fila >>interfaces.txt
    fila="iface $adaptador inet static"
    echo $fila >>interfaces.txt

}
#funcion para ingresar direccion ip
#function_direccion(){
 #   dialog --inputbox "Indica el direccion IP" 0 0 2>$OUTPUT
    # lee lo que  escribe Y ASIGNA A 
  #  n2=$(<$OUTPUT)
  #  dialog --msgbox  "ingresaste: "$n2 0 0
#}
#Funcion para ingresar
#function_puerta(){
#}
#funcion para ingresar mascara
#function_mascara(){
#}
#funcion para ingresar el broadcast
#function_broadcast(){
#}
#funcion para ingresar el dns1
#fucntion_dns1(){
#}
#funcion para ingresar el dns2
#function_dns2(){
#}
#funcion para mostrar los datos
function_datos(){
   dialog --title "Indica el primer numero" \
	--backtitle "bakctitle" \
 #  dialog --msgbox $OUTPUT
	dialog --msgbox adaptador
}
#Menu principal
function_menu(){
        INPUT=/tmp/menu.sh.$$
        dialog --clear --title "PROGRAMA -- PRINCIPAL" \
        --backtitle "CONEXIONES ADAPTADORES" \
        --menu "Elige una opcion" 20 50 10 \
                Adaptador_de_red "formato(enp0s3)" \
                Direccion_IP "(123.123.123.123)" \
                Puerta_enlace "gateway" \
                Mascara_de_Red "Netmask" \
                Direccion_de_broadcast "Broadcast" \
		DNS_1 "dns1" \
		DNS_2 "dns2" \
		Mostrar "datos" \
		Crear "crear" \
                Salir "Salir del Script" 2>"${INPUT}"

        #lee lo q escriben
        menuitem=$(<"${INPUT}")
        echo $menuitem
        #entra en el case
        case $menuitem in
                Adaptador_de_red) echo "Elegiste Adaptador"; function_adaptador;;
		Direccion_IP) echo "Elegiste direccion"; function_direccion;;
                Puerta_enlace) echo "Elegiste puerta"; function_puerta;;
                Mascara_de_Red) echo "Elegiste mascara"; function_mascara;;
                Direccion_de_broadcast) echo "Elegiste broadcast"; function_broadcast;;
                Dns_1) echo "Elegiste dns1"; function_dns1;;
                Dns_2) echo "Elegiste dns2"; function_dns2;;
                Crear) echo "Elegiste crear"; function_crear;;
                Mostrar) echo "Elegiste mostrar"; function_datos;;
                Exit) echo "Bye";
        esac
}
while true
do
        function_menu
done


