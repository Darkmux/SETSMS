#!/bin/bash
#
# target: (26/01/2021)
#
# [Open Source] - [Código Abierto]
#
# Variables y Colores
#
PWD=$(pwd)
OS=$(uname -o)
USER=$(id -u)
verde='\033[32m'
blanco='\033[37m'
rojo='\033[31m'
azul='\033[34m'
negro='\033[0;30m'
rosa='\033[38;5;207m'
amarillo='\033[33m'
morado='\033[35m'
cian='\033[1;36m'
magenta='\033[1;35m'
#
# Mensaje de Opción Incorrecta
#
function Error {
echo -e "${rojo}
┌═════════════════════┐
█ ${blanco}¡OPCIÓN INCORRECTA! ${rojo}█
└═════════════════════┘
"${blanco}
sleep 0.5
}
#
# Banner SETSMS
#
function SETSMS {
	sleep 0.5
	clear
echo -e "${verde}
███████╗███████╗████████╗███████╗███╗   ███╗███████╗
██╔════╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║██╔════╝
███████╗█████╗     ██║   ███████╗██╔████╔██║███████╗
╚════██║██╔══╝     ██║   ╚════██║██║╚██╔╝██║╚════██║
███████║███████╗   ██║   ███████║██║ ╚═╝ ██║███████║
╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝╚══════╝"${blanco}
}
#
# Solicitando Número Telefónico
#
function PhoneNumber {
SETSMS
echo -e -n "${verde}
┌════════════════════════════┐
█ ${blanco}INGRESE EL NÚMERO OBJETIVO ${verde}█
└════════════════════════════┘
┃    ┌═════════┐  ┌═══════════════┐
└═>>>█ ${blanco}EJEMPLO ${verde}█=>█ ${azul}+593981480757 ${verde}█
┃    └═════════┘  └═══════════════┘
┃    ┌════════════════════════════════════════┐
└═>>>█ ${rojo}RECUERDE INGRESAR EL NÚMERO TODO JUNTO ${verde}█
┃    └════════════════════════════════════════┘
┃
└═>>> "${blanco}
read -r PHONE
sleep 0.5

echo -e "${verde}
           ┌═════════════════┐
           █ ${azul}NÚMERO GUARDADO ${verde}█
           └═════════════════┘
   ┌═════════════════════════════════┐
   █ ${blanco}SI YÁ USÓ ÉSTA HERRAMIENTA EN   ${verde}█
   █ ${blanco}UN NÚMERO TELEFÓNICO, TIENE QUE ${verde}█
   █ ${blanco}ESPERAR 24 HORAS PARA USARLA    ${verde}█
   █ ${blanco}NUEVAMENTE EN EL MISMO NÚMERO,  ${verde}█
   █ ${blanco}DE LO CONTRARIO, PUEDE QUE LA   ${verde}█
   █ ${blanco}HERRAMIENTA NO RESPONDA CON LA  ${verde}█
   █ ${blanco}MISMA CANTIDAD DE MENSAJES QUE  ${verde}█
   █ ${blanco}ENVIÓ EN LA PRIMERA VEZ...      ${verde}█
   └═════════════════════════════════┘
 ┌══════════════════════════════════════┐
 █ ${rojo}EL SPAM DE SMS PUEDE DURAR DE 2 A 3  ${verde}█
 █ ${rojo}MINUTOS, SIN EMBARGO, PUEDE CANCELAR ${verde}█
 █ ${rojo}EL PROCESO Y ENVÍO DE ESTOS MISMOS,  ${verde}█
 █ ${rojo}CON LA COMBINACIÓN DE TECLAS...      ${verde}█
 └══════════════════════════════════════┘
            ┌══════┐   ┌═══┐
            █ ${azul}CTRL ${verde}█ + █ ${azul}C ${verde}█
            └══════┘   └═══┘
┌═════════════════════════════════════════┐
█ ${blanco}PULSE ENTER PARA INICIAR EL SPAM DE SMS ${verde}█
└═════════════════════════════════════════┘
"${blanco}
read
}
#
# Llamando a las Herramientas Quack e Impulse
#
function SendSMS {
cd ${RUTA}/quack
python3 quack --tool SMS --target ${PHONE} --threads 60 --timeout 90
cd ${RUTA}/Impulse
python3 impulse.py --method SMS --time 90 --threads 60 --target ${PHONE}
cd ${RUTA}
}
function Backup {
SETSMS
echo -e -n "${verde}
┌════════════════════════════════════┐
█ ${blanco}¿GUARDAR NÚMERO EN LA LISTA NEGRA? ${verde}█
└════════════════════════════════════┘
┃
└═>>> ┃${azul} ${PHONE} ${verde}┃
┃
┃    ┌═══════════════════┐
└═>>>█ [${blanco}01${verde}] ┃ ${blanco}SI GUARDAR ${verde}█
┃    └═══════════════════┘
┃    ┌═══════════════════┐
└═>>>█ [${blanco}02${verde}] ┃ ${blanco}NO GUARDAR ${verde}█
┃    └═══════════════════┘
┃
└═>>> "${blanco}
read -r SCRIPT
sleep 0.5

if [[ ${SCRIPT} == 1 || ${SCRIPT} == 01 ]]; then
echo -e -n "${verde}
┌══════════════════════════════════┐
█ ${blanco}INGRESE UN NOMBRE PARA SU NÚMERO ${verde}█
└══════════════════════════════════┘
┃    ┌═════════┐  ┌═════════┐
└═>>>█ ${blanco}EJEMPLO ${verde}█=>█ ${azul}Darkmux ${verde}█
┃    └═════════┘  └═════════┘
┃
└═>>> "${blanco}
read -r NAME
sleep 0.5
echo -e "PHONE='${PHONE}'" >> ${RUTA}/tools/list.sh
echo -e "NAME='${NAME}'" >> ${RUTA}/tools/list.sh
echo -e 'echo -e "${blanco}${NAME} ${verde}=>${azul} ${PHONE}"
sleep 1' >> ${RUTA}/tools/list.sh
echo -e "PHONE='${PHONE}'" >> ${RUTA}/tools/spam.sh
echo -e "NAME='${NAME}'" >> ${RUTA}/tools/spam.sh
echo -e 'echo -e "${verde}
┌══════════┐
█ ${blanco}OBJETIVO ${verde}█
└══════════┘
${blanco}
${NAME} ${verde}=>${azul} ${PHONE}"
sleep 1' >> ${RUTA}/tools/spam.sh
echo -e "source ${RUTA}/numbers/${NAME}.sh" >> ${RUTA}/tools/spam.sh
echo -e "#!/bin/bash
cd ${RUTA}/quack
python3 quack --tool SMS --target ${PHONE} --threads 60 --timeout 90
cd ${RUTA}/Impulse
python3 impulse.py --method SMS --time 90 --threads 60 --target ${PHONE}
cd ${RUTA}" >> ${RUTA}/numbers/${NAME}.sh
echo -e "${verde}
┌══════════════════════════════┐
█ ${blanco}NÚMERO GUARDADO EN EL SCRIPT ${verde}█
└══════════════════════════════┘
┃
└═>>>${blanco} ${RUTA}/numbers/${NAME}.sh"${blanco}
elif [[ ${SCRIPT} == 2 || ${SCRIPT} == 02 ]]; then
exit
else
Error
Backup
fi
}
#
# Regresando al Menu Principal
#
function Restart {
echo -e "${verde}
┌════════════════════════════┐
█ ${blanco}PULSE ENTER PARA CONTINUAR ${verde}█
└════════════════════════════┘"${blanco}
read
source ${RUTA}/SETSMS.sh
}
#
# Declarando Funciones
#
PhoneNumber
SendSMS
Backup
Restart
