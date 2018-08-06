#!/bin/bash 

if [[ "$(docker images -q ctx_rfid/v1 2> /dev/null)" == "" ]]; then
  # creamos imagen necesaria dado que no existe
  docker build -t ctx_rfid/v1 .
fi

if [ $# -eq 0 ] || [ "$1" == "-h" ] ; then

  echo "Linux command line tool for China 125kHz rfid reader/writer. "
  echo "  -idVendor:  0x6688";
  echo "  -idProduct: 0x6850";
  echo "   Product on amazon.es: B07542LYVB";
  echo "   https://www.amazon.es/Duplicador-Copiadoras-Herramienta-Controlador-NORDSD/dp/B07542LYVB";
  echo "";
  echo "Usage: ctx-idrw-203.sh [OPTIONS]...";
  echo "          -r Read rfid tag/fob";
  echo "          -w [10 char hex string] write data to tag/fob";
  echo "          -f [1|2] tag format to writer process";
  echo "               1 T5577/EM4100 tag";
  echo "               2 EM4305 tag";
  echo "          -v verbose mode";
  echo " ";
  echo "Examples:";
  echo " Read rfid tag:";
  echo "  > root@host:~# ./ctx-idrw-203.sh -r";
  echo "  > 0F0021BC9B";
  echo " Write a T5577 rfid tag:";
  echo "  > root@host:~# ./ctx-idrw-203.sh -w 0F0021BC9B -f 1";
  echo "  > 0F0021BC9B";
  echo " Write a EM4305 rfid tag:";
  echo "  > root@host:~# ./ctx-idrw-203.sh -w 0F0021BC9B -f 2";
  echo "  > 0F0021BC9B";
  echo "  ";
  echo " Writing to an incompatible tag or no tag detected to read:"
  echo "  > root@host:~# ./ctx-idrw-203.sh -r";
  echo "  > NOTAG"; 

else

  docker run --rm ctx_rfid/v1 ctx-idrw-203 $@ 

fi


