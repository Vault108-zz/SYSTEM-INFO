#!/bin/bash
clear
whiptail --msgbox "
---------------------------------------------------------
* * * * * * * * * Vault's Sys Info Script * * * * * * * *
---------------------------------------------------------
Press Ok to continue
 " 20 78
trap 'rm -f choice$$' EXIT
while whiptail    --title Vaults_Sys_Info --menu "Make your choice"   16 78 5 \
        "1)" "Check Kernel" "2)" "Up Time" "3)" "Free Ram" "4)" "CPU"  "5)" "IP Info" "6)" "Speedtest"  "7)" "Network Info" 2> choice$$
do      read CHOICE < choice$$
        case $CHOICE in
        ("1)")  whiptail --textbox /dev/stdin 40 80 <<<"$(uname -r)";;
        ("2)")  whiptail --textbox /dev/stdin 40 80 <<<"$(uptime -p)";;
        ("3)")  whiptail --textbox /dev/stdin 40 100 <<<"$(free -h > mem.txt && cat mem.txt && rm mem.txt )";;
        ("4)")  whiptail --textbox /dev/stdin 40 80 <<<"$( cat /proc/cpuinfo | grep 'model name' | uniq )";;
        ("5)")  whiptail --textbox /dev/stdin 40 80 <<<"$(wget -nv -O ip.txt ipinfo.io && cat ip.txt && rm ip.txt)";;
        ("6)")  whiptail --textbox /dev/stdin 40 80 <<<"$(wget -nv https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py && python speedtest.py && rm speedtest.py)";;
        ("7)")  whiptail --textbox /dev/stdin 40 100 <<<"$( ifconfig > if.txt && cat if.txt && rm if.txt)";;
  #      ("8)")  whiptail --textbox /dev/stdin 40 80 <<<"$(uname -r)";;
  #      ("9)")  whiptail --textbox /dev/stdin 40 80 <<<"$(uname -r)";;                    
  #      ("10)")  whiptail --textbox /dev/stdin 40 80 <<<"$(uname -r)";;                      
  #      ("11)")  whiptail --textbox /dev/stdin 40 80 <<<"$(uname -r)";;                    
  #      ("12)")  whiptail --textbox /dev/stdin 40 80 <<<"$(uname -r)";;                  
        esac
done

