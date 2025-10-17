#!/bin/bash
###############################################################################
# 7z Password Tester
#
# Automatically tests passwords from a list to decrypt password-protected
# 7z/ZIP archives. Tests each password sequentially and reports the correct one.
#
# @author      Torwald45
# @link        https://github.com/Torwald45/bash-7z-password-tester
# @license     GPL-2.0-or-later
# @version     2.0.0
###############################################################################

found=false

# Remove trailing spaces from each line in passwordlist
sed -i 's/[[:space:]]*$//' passwordlist

# Loop through each password in passwordlist
while IFS= read -r password; do
    echo "Testing password: '$password'"
    
    # Remove the unzipped directory if it exists
    rm -rf unzipped
    
    # Attempt to unzip with the current password
    7z x -p"$password" zipped_file.zip -o"unzipped" > /dev/null 2>&1
    
    # Check if the unzip directory is not empty and contains non-empty files
    if [ "$(find unzipped -type f -size +0c 2>/dev/null)" ]; then
        echo "Good password is: $password"
        found=true
        break
    else
        echo "Password '$password' failed or produced empty files."
        rm -rf unzipped  # Clean up the failed attempt
    fi
done < passwordlist

# If no password was found, output a message
if [ "$found" = false ]; then
    echo "Good password is: not found"
fi
