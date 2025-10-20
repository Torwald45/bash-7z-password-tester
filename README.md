# Bash 7z Password Tester

Bash script that automatically tests passwords from a list to decrypt password-protected 7z/ZIP archives. Tests each password sequentially and reports the correct one.

## Features

- Automatic password testing from text file list
- Removes trailing spaces from passwords
- Sequential testing with progress output
- Directory cleanup between attempts
- Success/failure reporting
- Works with 7z and ZIP encrypted archives

## Requirements

- Linux operating system
- Bash shell
- 7-Zip tool (p7zip-full package)

### Installation of 7-Zip

**Debian/Ubuntu/Linux Mint:**
```bash
sudo apt-get install p7zip-full
```

## Installation

1. Clone or download this repository
2. Make the script executable:
```bash
chmod +x 7z-password-tester.sh
```

## Usage

### Basic usage with included test files:

```bash
./7z-password-tester.sh
```

The script will test passwords from `passwordlist` against `zipped_file.zip`.

### Usage with your own files:

1. **Prepare password list:**
   - Edit `passwordlist` file
   - Add one password per line
   - Script automatically removes trailing spaces

2. **Prepare encrypted archive:**
   - Replace `zipped_file.zip` with your encrypted file
   - Or modify script to use different filename

3. **Run the script:**
```bash
./7z-password-tester.sh
```

### Example output:

```
Testing password: 'examplepassword1'
Password 'examplepassword1' failed or produced empty files.
Testing password: 'examplepassword2'
Password 'examplepassword2' failed or produced empty files.
Testing password: 'avatar'
Good password is: avatar
```

## Files in Repository

- `7z-password-tester.sh` - Main bash script
- `passwordlist` - Example password list (for testing)
- `zipped_file.zip` - Example encrypted ZIP file (for testing)
- `README.md` - This documentation
- `CHANGELOG.md` - Version history
- `LICENSE` - GPL v2 or later

## Technical Details

### Script Logic

1. Reads passwords line by line from `passwordlist`
2. Removes trailing spaces using `sed`
3. For each password:
   - Attempts to extract archive using `7z x -p"password"`
   - Checks if extraction produced non-empty files
   - Reports success or moves to next password
4. Cleans up failed attempts (removes `unzipped` directory)
5. Reports final result

### Output Directory

- Extracted files go to `unzipped/` directory
- Directory is created/removed automatically
- Only successful extraction keeps the directory

## Customization

### Change target archive file:

Edit line 24 in script:
```bash
7z x -p"$password" your_archive.7z -o"unzipped" > /dev/null 2>&1
```

### Change password list file:

Edit line 18 and 20:
```bash
sed -i 's/[[:space:]]*$//' your_passwordlist.txt
...
done < your_passwordlist.txt
```

### Change output directory:

Replace `unzipped` with your preferred directory name throughout the script.

## Security Notes

- **Do not commit real passwords to version control**
- The included `passwordlist` contains:
  - 999 most common passwords from darkweb2017 dataset
  - 16 example passwords at the end (examplepassword1-15 + **avatar**)
  - **Correct password for test file:** `avatar` (last password in list)
- The included `zipped_file.zip` is a test file (password: **avatar**)
- For real use, you can use included list or create your own

## Popular Password Lists

For extended password testing, use these wordlists:

- **[SecLists](https://github.com/danielmiessler/SecLists)** - Comprehensive password lists
  - `10k-most-common.txt` - Top 10,000 passwords
  - `darkweb2017_top-10000.txt` - Top 10,000 from darkweb leaks
  - `Passwords/Common-Credentials/` - Multiple wordlists

- **[CrackStation](https://crackstation.net/crackstation-wordlist-password-cracking-dictionary.htm)** - 1.5 billion unique passwords

Download and replace `passwordlist` file with your chosen wordlist.

## Testing

Test with included files:
```bash
./7z-password-tester.sh
```

Expected result: Script will find password "avatar" after testing 16 passwords.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.

## License

GPL v2 or later

## Author

[Torwald45](https://github.com/Torwald45)
