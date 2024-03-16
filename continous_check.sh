#!/bin/bash
# chmod +x check_users.sh
# Open the crontab for editing:  
# 	sudo crontab -e
# 	*/5 * * * * /path/to/check_users.sh

# Check if there are any users logged in
if who | grep -q '[a-zA-Z0-9]'; then
    echo "There are users logged into the system."
    # Place any commands you want to run here
else
    echo "No users are currently logged in."
fi
