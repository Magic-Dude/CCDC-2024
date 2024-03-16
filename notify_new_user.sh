# For Debian/Ubuntu
# sudo apt-get install inotify-tools

# For CentOS/RHEL
# sudo yum install inotify-tools

# For Fedora
# sudo dnf install inotify-tools

# HOW TO RUN
# chmod +x notify_new_user.sh
# ./notify_new_user.sh

#!/bin/bash

# Path to monitor
FILE_TO_WATCH="/etc/passwd"

# Command to execute when a change is detected (customize this)
NOTIFY_CMD="echo 'A new user has been created.'"

# Using inotifywait to monitor for changes in the file
inotifywait -m -e modify "$FILE_TO_WATCH" | while read path action file; do
    # Check if the modified file is /etc/passwd
    if [[ "$file" = "passwd" ]]; then
        # Execute the notification command
        eval "$NOTIFY_CMD"
    fi
done
