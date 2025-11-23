# HASH-DECRYPTOR.sh
 ># 🔐 Hash Cracker (Bash)
A professional Bash-based **hash identifier + wordlist hash cracker** built for **legal password recovery**, cybersecurity practice, and OSINT research.

This tool supports the following hash types:

- **MD5**
- **SHA1**
- **SHA256**
- **SHA512**

> ⚠️ *This tool does NOT “decrypt” hashes.*  
> It performs **wordlist-based hash cracking**, meaning it compares each word in a list to find a match.  
> Use this tool legally and ethically only on systems you own or have permission to test.

---

## 🚀 Features
✔ Automatic hash type detection  
✔ Supports 4 major hash algorithms  
✔ Fast wordlist-based cracking  
✔ Color-coded terminal output  
✔ Works on **Kali Linux**, Ubuntu, macOS, WSL  
✔ Perfect for GitHub OSINT & cybersecurity portfolios  

---

## 📂 Project Structure

---

## 🛠 Requirements
This tool requires the following Linux utilities:

- `bash`
- `md5sum`
- `sha1sum`
- `sha256sum`
- `sha512sum`

Pre-installed on **Kali Linux** and most Linux systems.

For cracking, you need a wordlist such as:


---

# 📌 Installation

### 1️⃣ Clone the repository
```bash
git clone https://github.com/yourusername/hash-cracker.git
cd hash-cracker
chmod +x hash-cracker.sh
./hash-cracker.sh
Enter hash to crack: 5f4dcc3b5aa765d61d8327deb882cf99
Enter path to wordlist: /usr/share/wordlists/rockyou.txt
========================================
         HASH IDENTIFIER + CRACKER
========================================

Enter hash to crack: 5f4dcc3b5aa765d61d8327deb882cf99
Enter path to wordlist: rockyou.txt

[+] Detected Hash Type: MD5
[+] Starting cracking...
[+] Hash Cracked!
Plaintext: password
