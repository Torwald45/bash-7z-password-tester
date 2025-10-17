# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [2.0.1] - 2025-10-17

### Changed
- Extended passwordlist from 16 to 1015 passwords
- Passwordlist now includes 999 most common passwords from darkweb2017 dataset
- Original example passwords (examplepassword1-15 + avatar) moved to end of list
- Updated README with links to popular wordlists (SecLists, RockYou, CrackStation)

### Added
- Security notes about included passwords
- Popular Password Lists section in README

## [2.0.0] - 2025-10-17

### Changed
- **BREAKING CHANGE:** Repository renamed from 7z_zip_file_automatic_password_tester to bash-7z-password-tester
- Script renamed from 7z_password_tester.sh to 7z-password-tester.sh
- README renamed from readme.md to README.md (capitalized)

### Added
- Script header with author, license, version information
- CHANGELOG.md for version tracking
- LICENSE file (GPL v2 or later)
- .gitignore file
- Improved error handling in script
- Better documentation in README

### Technical
- Script functionality unchanged (same password testing logic)
- Example files (passwordlist, zipped_file.zip) kept for testing

## [1.0.0] - 2024-09-02

### Added
- Initial version with basic password testing
- Automatic trailing space removal from passwords
- Sequential password testing from passwordlist file
- Directory cleanup between attempts
- Success/failure reporting
