#Create randomly generated file to reference
#find /{bin,etc,lib,lib64,usr/{bin,lib,sbin},sbin} -type f | sort -R > ~/Desktop/selfharm.txt



# Set warning message
echo -e "\e[93m( _______  _______  _______  _______  _                 _  _______                                                          
(  ____ \(  ____ )(  ___  )(  ____ )| \    /\|\     /|( )(  ____ \                                                         
| (    \/| (    )|| (   ) || (    )||  \  / /( \   / )|/ | (    \/                                                         
| (_____ | (____)|| (___) || (____)||  (_/ /  \ (_) /    | (_____                                                          
(_____  )|  _____)|  ___  ||     __)|   _ (    \   /     (_____  )                                                         
      ) || (      | (   ) || (\ (   |  ( \ \    ) (            ) |                                                         
/\____) || )      | )   ( || ) \ \__|  /  \ \   | |      /\____) |                                                         
\_______)|/       |/     \||/   \__/|_/    \/   \_/      \_______)                                                         
 _______  _______  _        _______               _______  _______  _______    _       _________ _                         
(  ____ \(  ____ \( \      (  ____ \    |\     /|(  ___  )(  ____ )(       )  ( \      \__   __/( (    /||\     /||\     /|
| (    \/| (    \/| (      | (    \/    | )   ( || (   ) || (    )|| () () |  | (         ) (   |  \  ( || )   ( |( \   / )
| (_____ | (__    | |      | (__  _____ | (___) || (___) || (____)|| || || |  | |         | |   |   \ | || |   | | \ (_) / 
(_____  )|  __)   | |      |  __)(_____)|  ___  ||  ___  ||     __)| |(_)| |  | |         | |   | (\ \) || |   | |  ) _ (  
      ) || (      | |      | (          | (   ) || (   ) || (\ (   | |   | |  | |         | |   | | \   || |   | | / ( ) \ 
/\____) || (____/\| (____/\| )          | )   ( || )   ( || ) \ \__| )   ( |  | (____/\___) (___| )  \  || (___) |( /   \ )
\_______)(_______/(_______/|/           |/     \||/     \||/   \__/|/     \|  (_______/\_______/|/    )_)(_______)|/     \|
                                                                                                                           

)"


echo -e "(\e[0m 
         )"
#default terminal color:\e[0m

#Nice red damage color: \e[91m


function txtbuilder {
        if [ ! -e ~/Desktop/selfharm.txt ]
then
        echo "Building File of Doom"
	find /{bin,etc,lib,lib64,usr/{bin,lib,sbin},sbin} -type f | sort -R > ~/Desktop/selfharm.txt
        echo "File of Doom created at ~/Desktop/selfharm.txt. Every mistake will randomly delete one system file."
        echo "Type Carefully!"
fi


}

function linenumb {
        echo $(wc -l ~/Desktop/selfharm.txt | awk '{print $1}')
}

function randomline {
        echo $(shuf -i 1-$(linenumb) -n 1)
}

function alltogethernow {
        txtbuilder
        randomline
}

#================================================================================================================
#================================================================================================================

txtbuilder




function command_not_found_handle {
    filetodelete=$(sed -n $(randomline)d ~/Desktop/selfharm.txt)
    echo "\e[91mOops, looks like you misspelt something >:)"
    echo "Hope you didn't need $filetodelete..."

	rm -f --interactive=never filetodelete

    sleep .5

    echo "(\e[0m
	)"
}






#Use wc -l, output to shuf -i 1-[end of document in lines] -n 1, sed [determined line]d selfharm.txt 
