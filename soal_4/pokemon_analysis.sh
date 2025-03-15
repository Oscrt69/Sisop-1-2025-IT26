#!/bin/bash

data_file="pokemon_usage.csv"

if [ ! -f "$data_file" ]; then
	echo "Error: File $data_file not found."
	exit 1
fi

echo "Script pokemon_analysis.sh ready to use."

# help screen
if [ "$2" = "-h" ] || [ "$2" = "--help" ]; then
echo "                         *******************  "
echo "                      ************************* "
echo "                    ***************************** "
echo "                  ********************************* "
echo "                 ************************************ "
echo "               **************############************** "
echo "             ***************#            #*************** "
echo "             **************#    ######    #************** "
echo "             ##############    #      #    ############## "
echo "             #############    #        #    ############# "
echo "             ##############    #      #    ############## "
echo "             **************#    ######    #************** "
echo "             ***************#            #*************** "
echo "               **************############************** "
echo "                 ************************************ "
echo "                  ********************************** "
echo "                    ******************************  "
echo "                      ************************** "
echo "                        ********************* "

echo ""
echo "Usage: ./pokemon_analysis.sh <file_name> [options]"
echo ""
echo "Options:"
echo " -h, --help           Show this help message."
echo " -i, --info           Show the highest adjusted and raw usage."
echo " -s, --sort <method>  Sort data by a specific column."
echo "     name             Sort by Pokemon name."
echo "     usage            Sort by Adjusted Usage."
echo "     raw              Sort by Raw Usage."
echo "     hp               Sort by HP."
echo "     atk              Sort by Attack."
echo "     def              Sort by Defense."
echo "     spatk            Sort by Special Attack."
echo "     spdef            Sort by Special Defense."
echo "     speed            Sort by Speed."
echo " -g, --grep <name>    Search for a specific Pokemon sorted by usage."
echo " -f, --filter <type>  Filter by type of Pokemon sorted by usage."

fi

# info pokemon
if [ "$2" = "--info" ]; then
	if [ ! -s "$data_file" ]; then
		echo "Error: $data_file does not contain valid data"
		echo " Use -h or --help for more information."
		exit 1
	fi

        highest_usage=$(tail -n +2 "$data_file" | sort -t, -k2 -nr | head -n 1 | cut -d, -f1,2)
	highest_raw=$(tail -n +2 "$data_file" | sort -t, -k3 -nr | head -n 1 | cut -d, -f1,3)

        usage_pokemon=$(echo "$highest_usage" | cut -d, -f1)
        usage_value=$(echo "$highest_usage" | cut -d, -f2)

        raw_pokemon=$(echo "$highest_raw" | cut -d, -f1)
        raw_value=$(echo "$highest_raw" | cut -d, -f2)

 	echo "Meta Report: Gen 9 OverUsed"
        echo "Scariest Opponent: $usage_pokemon is terrorizing the meta at $usage_value usage!"
	echo "Most Picked Pokemon: $raw_pokemon with a crazy $raw_value uses!"
	echo "Time to build a GOAT-strategy!"

        exit 0
fi

# error handling
if [ $# -lt 3 ]; then
	echo "Error: no $2 option provided."
	echo "Use -h or --help for more information."
	exit 1
fi

file="$1"
option="$2"
value="$3"

declare -A COLUMNS=(
	["name"]=1
	["usage"]=2
	["raw"]=3
	["hp"]=6
	["atk"]=7
	["def"]=8
	["spatk"]=9
	["spdef"]=10
	["speed"]=11
)

# grep or filter pokemon
if [ "$option" = "--grep" ] || [ "$option" = "--filter" ]; then
        if [ -z "$value" ]; then
                echo "Error: no search keyword provided."
                echo "Use -h or --help for more information."
                exit 1
        fi

        head -n 1 "$file"
        tail -n +2 "$file" | grep -i -w "$value" | sort -t, -k2 -n -r
        exit 0
fi

# sorting pokemon
if [ -z "${COLUMNS[$value]}" ]; then
        echo "Error: Invalid sort method '$value'."
        echo "Use -h or --help for more information."
        exit 1
fi

head -n 1 "$file"

if [ "$value" == "name" ]; then
        tail -n +2 "$file" | sort -t, -k${COLUMNS[$value]}
else
        tail -n +2 "$file" | sort -t, -k${COLUMNS[$value]} -n -r
        exit 0
fi


