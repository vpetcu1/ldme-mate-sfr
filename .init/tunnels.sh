#!/bin/bash
create_tunnels () {
	echo ------------ OPENNING TUNELS
	echo ------------ OPENNING HR MySQL on 3606 localhost
	sshpass -p "$password" ssh -Nf -4 -L 3606:vi-mcc-mydis-201:3408 "$username"@sp-mut-adm-201.adm.gnp.les800
    echo ------------ OPENNING TRP MySQL on 3609 localhost
	sshpass -p "$password" ssh -Nf -4 -L 3607:vi-mcc-mydis-301:3408 "$username"@sp-mut-adm-201.adm.gnp.les800
	echo ------------ OPENNING CA MySQL on 3608 localhost
	sshpass -p "$password" ssh -Nf -4 -L 3608:vi-mcc-myca-201:3406 "$username"@sp-mut-adm-201.adm.gnp.les800
	echo ------------ OPENNING HR AR MySQL on 3609 localhost
	sshpass -p "$password" ssh -Nf -4 -L 3609:vi-mcc-myar-201:3418 "$username"@sp-mut-adm-201.adm.gnp.les800
	echo ------------ OPENNING TRP AR MySQL on 3610 localhost
	sshpass -p "$password" ssh -Nf -4 -L 3610:vi-mcc-myar-301:3418 "$username"@sp-mut-adm-201.adm.gnp.les800
	echo ------------ OPENNING CONV MySQL on 3611 localhost
	sshpass -p "$password" ssh -Nf -4 -L 3611:vi-mcc-mycnv-901:3408 "$username"@sp-mut-adm-201.adm.gnp.les800
	echo ------------ OPENNING Oracle on 1521 localhost
	sshpass -p "$password" ssh -Nf -L1521:sv-mut-ora-202.int.gnp.les800:1521 "$username"@vi-mcc-dmc-201.adm.gnp.les800
	echo ------------ OPENNING Oracle on 1522 localhost
	sshpass -p "$password" ssh -Nf -L1522:fi-mcc-ora-302.int.gnp.les800:1522 "$username"@vi-mcc-dmc-201.adm.gnp.les800
	echo ------------ OPENNING SSHUTLE on LDAP
	sshuttle -r "$username:$password"@vp-mcc-dmc-201.adm.gnp.les800 10.40.66.4/32 --disable-ipv6
}

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
			echo PLEASE INSERT PASSWORD
			read password
	fi
}

input_start


while [ $selected != 5 ]
do
	if [ $selected = 1 ]
		then 
			echo ------------ OPENED TUNELS
			ps -ef | grep ssh
			
	elif [ $selected = 2 ]
		then
			echo ------------ KILLING
			killall ssh
	elif [ $selected = 3 ]
		then
			create_tunnels
	elif [ $selected = 4 ]
		then
			echo ------------ KILLING AND OPENNING TUNELS
			killall ssh
			create_tunnels
			ps -ef | grep ssh	
	fi
input_start
done
echo bye bye
