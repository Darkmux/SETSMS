#!/bin/bash
#
# REQUISITOS
#
# VARIABLES
#
PWD=$(pwd)
source ${PWD}/Colors.sh
#
# CÓDIGO
#
sleep 0.5
clear
cd
echo -e "${verde}
┌══════════════════════════════┐
█ ${blanco}Actualizando Repositorios... ${verde}█
└══════════════════════════════┘
"${blanco}
apt update && apt upgrade -y
sleep 0.5
clear
echo -e "${verde}
┌══════════════════════┐
█ ${blanco}Instalando python... ${verde}█
└══════════════════════┘"
pkg install -y python > /dev/null 2>&1
echo -e "${verde}
┌═══════════════════════┐
█ ${blanco}Instalando python2... ${verde}█
└═══════════════════════┘"
pkg install -y python2 > /dev/null 2>&1
echo -e "${verde}
┌════════════════════════┐
█ ${blanco}Instalando requests... ${verde}█
└════════════════════════┘"
pip install requests > /dev/null 2>&1
echo -e "${verde}
┌═════════════════════┐
█ ${blanco}Instalando quack... ${verde}█
└═════════════════════┘"
git clone https://github.com/TermuxHacking000/quack > /dev/null 2>&1
cd quack
chmod 777 quack.sh
./quack.sh
cd
echo -e "${verde}
┌═══════════════════════┐
█ ${blanco}Instalando Impulse... ${verde}█
└═══════════════════════┘"
git clone https://github.com/LimerBoy/Impulse > /dev/null 2>&1
cd Impulse
python -m pip install -r requirements.txt > /dev/null 2>&1
cd
cd SETSMS
chmod 711 SETSMS.sh
clear
echo -e "${verde}
┌═══════════════════════┐
█ ${blanco}REQUISITOS INSTALADOS ${verde}█
█ ${blanco}EJECUTE EL COMANDO:   ${verde}█
└═══════════════════════┘
┃
┃    ┌═════════════┐
└═>>>█ ${blanco}./SETSMS.sh ${verde}█
     └═════════════┘
"${blanco}
