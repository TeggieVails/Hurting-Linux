clear

echo -e "\e[93m ███████╗██████╗  █████╗ ██████╗ ██╗  ██╗██╗   ██╗
██╔════╝██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝╚██╗ ██╔╝
███████╗██████╔╝███████║██████╔╝█████╔╝  ╚████╔╝ 
╚════██║██╔═══╝ ██╔══██║██╔══██╗██╔═██╗   ╚██╔╝  
███████║██║     ██║  ██║██║  ██║██║  ██╗   ██║   
╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   
"



function userspeccheck {
	echo "Please specify location of .bashrc:"
		read userspecdir
		echo "Looking for .bashrc in specified directory"
	
		if [ -e "$userspecdir"]
			
			then 
				echo "Restoring .bashrc backup..."
				cp -f "$userspecdir" ~.bashrc
				echo "Backup restored Successfully however backup directory not deleted."
		fi
}




function toolmainmenu {
	echo -e "\e[0m Please select an option:"
	echo "Typing 'backup' will backup your .bashrc file to a folder in root"
	echo "Typing 'restore' will replace your currently active .bashrc file with either the backup made here or a directory you specify"
	read toolchoice

	case "$toolchoice" in

		backup)
			mkdir ~/backup
			cp ~/.bashrc ~/backup/.bashrc
			echo "Copy complete and saved to ~/backup/.bashrc. Happy Destruction!"
			;;

		restore)

			if [ -e ~/backup/.bashrc ]

			then
				echo "Restoring .bashrc backup..."
				mv -f ~/backup/.bashrc ~.bashrc
				echo "Backup Restored!"
			else
				echo "No .bashrc backup found, has it been renamed/is it in another directory?(y/n)"
				read confirmdir
				case "$confirmdir" in 
		
					y)
						userspeccheck
					;;

					n)
						echo "No backup of .bashrc, aborting..."
					;;
				esac
			fi
			;;

		*)
					echo "Invalid Selection"
					toolmainmenu
					;;
	esac
}

user=$(id -ru)

if [ $user=0 ]

	then 
		toolmainmenu

	else 
		tput bold
		echo "Please run this script as root, otherwise your user .bashrc file will be changed while still not executing the script properly"
		tput reset
fi
