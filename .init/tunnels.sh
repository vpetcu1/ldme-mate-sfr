#!/bin/bash
#author: Diana Pinho

input_start(){
	echo 
	echo PLEASE INSERT:
	echo 1: see open tunels
	echo 2: kill open tunels
	echo 3: open tunels
	echo 4: all
	echo 5: EXIT
	read selected
	if [ $selected = 3 ] || [  $selected = 4 ]
		then 
			echo PLEASE INSERT USERNAME
			read username
	fi
}

input_start


while [ $selected != 5 ]
do
	if [ $selected = 1 ]
		then 
			echo ------------ OPEN TUNELS
			ps -ef | grep ssh
			
	elif [ $selected = 2 ]
		then
			echo ------------ KILLING
			killall ssh
	elif [ $selected = 3 ]
		then
			echo ------------ OPENNING TUNELS
			echo ------------ OPENNING MySQL on 3606 localhost
			ssh -Nf -4 -L 3606:vi-mcc-mydis-201:3408 "$username"@sp-mut-adm-201.adm.gnp.les800
			echo ------------ OPENNING MySQL on 3607 localhost
			ssh -Nf -4 -L 3607:vi-mcc-myar-201:3418 "$username"@sp-mut-adm-201.adm.gnp.les800
			echo ------------ OPENNING SSHUTLE on LDAP
			sshuttle -r "$username"@vp-mcc-dmc-201.adm.gnp.les800 10.40.66.4/32 --disable-ipv6
	elif [ $selected = 4 ]
		then
			echo ------------ KILLING AND OPENNING TUNELS
			killall ssh
			echo ------------ OPENNING MySQL on 3606 localhost
			ssh -Nf -4 -L 3606:vi-mcc-mydis-201:3408 "$username"@sp-mut-adm-201.adm.gnp.les800
			echo ------------ OPENNING MySQL on 3607 localhost
			ssh -Nf -4 -L 3607:vi-mcc-myar-201:3418 "$username"@sp-mut-adm-201.adm.gnp.les800
			echo ------------ OPENNING SSHUTLE on LDAP
			sshuttle -r "$username"@vp-mcc-dmc-201.adm.gnp.les800 10.40.66.4/32 --disable-ipv6
			ps -ef | grep ssh	
	fi
input_start
done
echo bye bye
