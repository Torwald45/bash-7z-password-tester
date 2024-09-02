# Name
**7z_password_tester.sh**

# Description
The script **7z_password_tester.sh** automatically tests various passwords from a **passwordlist** text file, attempting to unzip an encrypted ZIP file using the **7z** tool. 

Before testing, it removes trailing spaces from each password (**sed** is used) and, for each attempt, deletes any existing output directory. 

Each password is tested in sequence, and the script checks if the file has been successfully unzipped, creating a new directory with the unzipped content. 

If a correct password is found, the script displays it; otherwise, it informs that no password worked.

# Key Features
The script's key feature is automated password testing to decrypt and verify a protected ZIP file.

# Requirements
- The script is written in Bash, so it requires a Unix-like operating system with Bash available (most Linux distributions and macOS have Bash pre-installed).

- 7-Zip tool installed. On Debian-based systems (e.g., Ubuntu, Linux Mint), you can install it with: 
```sudo apt-get install p7zip-full```

# Usage

* Password List File: Create a text file named passwordlist containing the passwords to be tested, with each password on a separate line.

* ZIP File: A ZIP file named zipped_file.zip that you want to decrypt and extract.

* These components must be in the same directory where you run the script, and the script must have execute permissions. E.g., use: 
```chmod +x 7z_password_tester.sh```

To run script use ```./7z_password_tester.sh``` command.
