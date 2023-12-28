# load-mail-warnings

## loadwarn.sh :

- A tool to send a mail if the CPU load/usage gets higher than a cetain threshold.
- Usefull when wanting to monitor a cloud based VPS with low resources.
  
# Install Command:

## Requirements
- An SMTP server setup (ex: nullmailer)
- The mailutils library (```sudo apt update && sudo apt install mailutils```)

### LINUX
```sh
curl https://raw.githubusercontent.com/GrimalDev/load-mail-warnings/main/loadwarn.sh -o loadwarn.sh ; sudo cp loadwarn.sh /bin/loadwarn ; sudo rm loadwarn.sh ; sudo chmod +x /bin/loadwarn
```
### MACOS
```sh
curl https://raw.githubusercontent.com/GrimalDev/load-mail-warnings/main/loadwarn.sh -o loadwarn.sh ; sudo cp loadwarn.sh /opt/homebrew/bin/loadwarn ; sudo rm loadwarn.sh ; sudo chmod +x /opt/homebrew/bin/loadwarn
```
---
**HOW TO**
### Parameters
  - First param: Threshold <0-5> (the test succeeds if the integer load is strictly higher than this number)
    
  Then, 
  - **OPTION 1:**
    - Second param: Email FROM
    - Third param: Email TO
  - **OPTION 2:**
    - Second param: --stdout-body (to print the body and not send the mail)
