#!/bin/bash

# Default directory for storing hashes 
HASH_PATH=~/.local/hash

# Create directory
mkdir -p ~/.local/hash

# init function
init()
{
    echo "Hashes stored successfully for $filename"
    find $filename -type f -exec sha256sum {} \; >> "$HASH_PATH/checksum"
}

# Check function 
check()
{
    echo "Checking hash for $filename"
    # check whole file 
    #sha256sum -c "$HASH_PATH/checksum"
    # Check specific file and repress warnings (warning gives for the whole file so could be confusing)
    sha256sum -c "$HASH_PATH/checksum" 2>/dev/null | grep $filename

}

# Update function 
update()
{
    init
}

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Verify the integrity of application log files to detect tampering."
   echo
   echo "Syntax: script [-h|i|check|update] filename"
   echo "options:"
   echo "h        Print this Help. Also -help"
   echo "i        init. On first use, store the computed hashes in a secure location. Requires filename"
   echo "c        check. Compare the newly computed hashes against the previously stored ones. Requires filename."
   echo "u        update. Update Hash. Requires filename"
   echo
}

############################################################
# Input options                                            #
############################################################
while getopts ":i:c:u:h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      help) # display Help 
         Help
         exit;;
      i) # Init function
         filename=$OPTARG
         init 
         exit;;
      c) # Check function
         filename=$OPTARG
         check
         exit;;
      u) # Update function
         filename=$OPTARG
         update
         exit;;   

      \?) # Invalid option
         echo "Error: Invalid option. Use -h for Help"
         exit;;     
   esac
done
