#!/bin/bash
# chmod +x check_admins.sh
# sudo ./check_admins.sh

# Define the group that grants admin privileges
ADMIN_GROUP=sudo

# Define the path to the file containing the expected admin usernames
EXPECTED_ADMINS_FILE="/path/to/expected_admins.txt"

# Get the list of actual admin users from the system
ACTUAL_ADMINS=$(getent group $ADMIN_GROUP | cut -d: -f4)

# Read the expected admins from file and check each one
while IFS= read -r user; do
    if [[ $ACTUAL_ADMINS = *"$user"* ]]; then
        echo "$user has admin privileges: OK"
    else
        echo "$user is expected to have admin privileges but does NOT: ERROR"
    fi
done < "$EXPECTED_ADMINS_FILE"

# Now, check if there are any unexpected admins
for admin in ${ACTUAL_ADMINS//,/ }; do
    if grep -q "^$admin$" "$EXPECTED_ADMINS_FILE"; then
        : # User is expected, do nothing
    else
        echo "$admin has admin privileges but is NOT expected: WARNING"
    fi
done


