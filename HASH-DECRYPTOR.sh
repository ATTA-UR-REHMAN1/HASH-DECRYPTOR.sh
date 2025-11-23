#!/bin/bash

#############################################
#      PROFESSIONAL HASH CRACKING TOOL      #
#     Legal Use Only — Password Recovery    #
#############################################

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear

echo -e "${YELLOW}========================================${NC}"
echo -e "${GREEN}         HASH IDENTIFIER + CRACKER      ${NC}"
echo -e "${YELLOW}========================================${NC}"
echo ""

# Input hash
read -p "Enter hash to crack: " hash_input
read -p "Enter path to wordlist: " wordlist

if [[ ! -f "$wordlist" ]]; then
    echo -e "${RED}Wordlist not found!${NC}"
    exit 1
fi

#############################################
#  HASH IDENTIFIER
#############################################
identify_hash_type() {
    length=${#hash_input}

    case $length in
        32) echo "MD5";;
        40) echo "SHA1";;
        64) echo "SHA256";;
        128) echo "SHA512";;
        *)
            echo "UNKNOWN"
            ;;
    esac
}

hash_type=$(identify_hash_type)

echo -e "${YELLOW}[+] Detected Hash Type: ${GREEN}$hash_type${NC}"
echo ""

if [[ "$hash_type" == "UNKNOWN" ]]; then
    echo -e "${RED}[-] Cannot identify hash type. Exiting.${NC}"
    exit 1
fi

#############################################
#  HASH CRACKING FUNCTION
#############################################
crack_hash() {
    echo -e "${YELLOW}[+] Starting cracking...${NC}"
    
    while IFS= read -r word; do
        
        case $hash_type in
            "MD5")    attempt=$(echo -n "$word" | md5sum | awk '{print $1}');;
            "SHA1")   attempt=$(echo -n "$word" | sha1sum | awk '{print $1}');;
            "SHA256") attempt=$(echo -n "$word" | sha256sum | awk '{print $1}');;
            "SHA512") attempt=$(echo -n "$word" | sha512sum | awk '{print $1}');;
        esac

        if [[ "$attempt" == "$hash_input" ]]; then
            echo -e "${GREEN}[+] Hash Cracked!${NC}"
            echo -e "${GREEN}Plaintext: $word${NC}"
            exit 0
        fi

    done < "$wordlist"

    echo -e "${RED}[-] No match found in the wordlist.${NC}"
}

crack_hash
