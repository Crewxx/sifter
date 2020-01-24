#!/bin/bash

ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'

echo -e "${ORNG}Blackwidow${NC}"
echo -e "${ORNG}***********${NC}"
options=("Crawl the target domain & fuzz all parameters (Verbose enabled)" "Fuzz all GET parameters for common OWASP Vulns (Verbose enabled)" "Back")
select opts in "${options[@]}"
do
    case $opts in
        "Crawl the target domain & fuzz all parameters (Verbose enabled)")
            echo -e "${YLW}"
            cat files/pingtest_pass.txt
            echo -e "${NC}"
            echo -e "${W}Please copy and paste in your target site${NC}"
				read TARGET1
            echo -e "${W}How many levels would you like to crawl?${NC}"
				read TARGET2
            echo -e "${W}Would you like to fuzz all possible parameters for OWASP vulns? (y/n)${NC}"
				read TARGET3
			echo -e "${LP}Running Blackwidow with the following command, 'blackwidow -u $TARGET1 -l $TARGET2 -s $TARGET3 -v y'${NC}"
				sleep 10
			sudo blackwidow -u $TARGET1 -l $TARGET2 -s $TARGET3 -v y
            ./modules/blackwidow_script.sh
            ;;
        
        "Fuzz all GET parameters for common OWASP Vulns (Verbose enabled)")
            echo -e "${YLW}"
            cat files/pingtest_pass.txt
            echo -e "${NC}"
            echo -e "${W}Please enter your target domain and trailing directories${NC}"
	    echo -e "${LP}ex. http://target.com/wp-content/uploads/${NC}"
	    sleep 2
	    read TARGETDMN
	    echo -e "${W}Please enter the target file & GET or POST parameters${NC}"
	    echo -e "${LP}ex. 'users.php?user=1&admin=true'${NC}"
	    sleep 2
	    read TARGETEXT
	    echo -e "${W}Running injectx script with the following argument, ${LP}'python injectx.py -u $TARGETDMN$TARGETEXT -v y'${NC}"
	    sleep 5
            sudo injectx.py -u $TARGET -v y
            ./modules/blackwidow_script.sh
            ;;
        
        "Back")
            ./modules/module_runner.sh
            ;;
    esac
done



            
