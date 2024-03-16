#!/bin/bash
# Save the modified script to a file, e.g., backup_script.sh.
# Make the script executable: chmod +x backup_script.sh. 
# Ex: to back up /etc/example.conf, use: sudo ./backup_script.sh example.conf
#

# Check if a filename is provided as a command-line argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# The filename to backup is the first command line argument
FILE_NAME="$1"
BACKUP_FILE_NAME="${FILE_NAME}_backup"

# Change directory to /etc
cd /etc

# Check if the file exists
if [ -f "$FILE_NAME" ]; then
    # Make a backup of the file
    cp "$FILE_NAME" "$BACKUP_FILE_NAME"
    
    # Change the permissions of the backup file to read-only for root
    chmod 400 "$BACKUP_FILE_NAME"
    
    echo "Backup of $FILE_NAME created and made read-only successfully."
else
    echo "Error: File $FILE_NAME does not exist in /etc."
fi
