#!/usr/bin/env bash
clear
function Menu(){
echo -e "1. Add user\n2. Add group\n3. Del user\n0. Exit"
read choice
}

function AllUserName(){
allUsers=`awk -F: '{print $1}' /etc/passwd`
echo -n "All users: "
echo -n $allUsers; echo -e "\n"
}
function AddUserID(){
echo -n "Enter user ID: "
read userID
AllGroups
echo -n "Enter group ID: "
read userGID
useradd $username -u $userID -g $userGID
}
function AllGroups(){
allgroups=$(awk -F: '{print $1 " - " $3}' /etc/group)
echo -n ${allgroups}
}
function AddUser(){
echo -e "1. Add username\n2. Add username + UID + GID"
read choice
case $choice in
    1) AllUserName; compareUserName; Asc;;
    2) AllUserName; compareUserName; Asc;;
    *) echo "RTFM"; ;;
esac
}
function AddUserName(){
sudo useradd $username
}
                                                                                                                               5,1       Наверху
function compareUserName(){
echo -n "Enter user name: "
read username
counter=0
for compareUser in $allUsers
do
if [ "$username" == "$compareUser" ]
    then let counter+=1
fi
done
if [ "$counter" -eq "0" -a "$choice" -eq "1" ]
    then AddUserName
    elif [ "$counter" -eq "0" -a "$choice" -eq "2" ]
        then AddUserID
    else
    echo "User already exists"
fi
}

function Asc(){
echo -n "Continue: 1 - Yes, 0 - No : "
read asc
case $asc in
    1) echo "Ok"; ;;
    0) echo "Bye"; let exit=false ;;
    *) echo "RTFM"; ;;
esac
}

exit=true
                                                                                                                               37,0-1        75%while [ "$exit" == "true" ]
do
Menu
case $choice in
    1) AddUser; ;;
    2) AddGroup; ;;
    0) echo "Bye"; let exit=false;;
    *) echo "RTFM"; ;;
esac
done
          
