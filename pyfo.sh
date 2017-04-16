# Script to create menus and take action according to that selected menu item.
#
#
while :
 do
 clear
 echo "---------------------------------------------------------"
 echo " * * * * * * * Vault's Sys Info Script * * * * * * * * * "
 echo "---------------------------------------------------------"
 echo "[1] Check Kernel"
 echo "[2] Uptime"
 echo "[3] Free RAM"
 echo "[4] Processor Info"
 echo "[5] Node Name"
 echo "[6] IP Info"
 echo "[7] Speedtest"
 echo "[8] Exit/stop"
 echo "----------------------------------------------"
 echo -n "Enter your menu choice [1-8]:"
 read yourch
 case $yourch in
   1) echo "Checking Kernel";  uname -r ; read -n 1 ;;
   2) echo "Checking Uptime" ; uptime -p ; read -n 1 ;;
   3) echo "Checking RAM" ; free -h ; read -n 1 ;;
   4) echo "Checking Processor"; uname -p ; read -n 1 ;;
   5) echo "Checking NODE ";  uname -n  ;  read -n 1  ;;
   6) echo "IP info"; wget -nv -O ip.txt ipinfo.io && cat ip.txt && rm ip.txt; read -n 1 ;;
   7) echo "Speetest "; wget -nv  https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py  && python speedtest.py && rm speedtest.py ; read -n 1 ;;
   8) exit 0
      ;;
   *) echo "Opps!!! Please select choice 1,2,3,4,5,6,7 or 8"
      echo "Press a key. . ."
      read -n 1
      ;;
 esac
done

