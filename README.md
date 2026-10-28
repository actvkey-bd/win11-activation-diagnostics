# Windows 11 & 10 Activation Forensic Diagnostic Tool 🛠️

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows%2011%20%7C%20Windows%2010-0078D6.svg)](https://microsoft.com)
[![Maintained by](https://img.shields.io/badge/Maintained%20by-ActvKey%20Research-16a34a.svg)](https://actvkey.com)

A lightweight, transparent, open-source command-line diagnostic and remediation toolkit for **Windows 11 and Windows 10**.

Helps IT administrators, developers, students, and PC builders identify their Windows license channel (Retail vs OEM vs Volume KMS), troubleshoot licensing errors (including the infamous **Error 0x803FA067**), and purge leftover KMS emulator malware caches without downloading sketchy third-party executables.

---

## ⚡ Key Features

- **Zero Third-Party Binaries:** 100% native batch and VBScript utilizing official Microsoft Windows Software Licensing Management Tool (`slmgr.vbs`).
- **Forensic License Channel Detection:** Instantly tells you if your key is a legitimate lifetime **Retail license**, a hardware-tied **OEM license**, or an expiring **Volume KMS emulator**.
- **Error 0x803FA067 Auto-Remediation:** Purges corrupted registry token caches (`tokens.dat` lockup) and resets the Windows Software Protection Service (`sppsvc`).
- **No Data Collection:** Runs entirely offline on your machine; zero telemetric tracking.

---

## 🚀 Quick Start

### 1. License Channel & Status Check
To inspect whether your current Windows license is genuine or using an expiring KMS server:
1. Download [`win11-activation-check.bat`](win11-activation-check.bat).
2. Right-click and choose **Run as administrator**.
3. View your channel, permanent validity, and partial product key.

### 2. Fixing Activation Error 0x803FA067
If Windows throws `Error 0x803FA067` when upgrading from Home to Pro:
1. Disconnect your Wi-Fi or Ethernet cable (Offline generic switch method).
2. Run [`error-0x803fa067-fix.bat`](error-0x803fa067-fix.bat) as Administrator.
3. Once the service restarts, reconnect the internet and apply your genuine retail key.

---

## 🔍 Understanding Error 0x803FA067

**Error 0x803FA067** occurs when the Windows Licensing Server fails to handshake during an edition upgrade. The primary culprits are:
1. **Home-to-Pro Upgrade Conflict:** Direct entry of a Pro key while Windows Home core packages are active without offline conversion.
2. **KMS Token Pollution:** Residual entries in `%SystemRoot%\System32\spp\store\2.0\tokens.dat` left behind by pirated KMS activators pointing to blocked KMS emulation servers.
3. **Registry Key Caching:** Previous keys locked inside `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform`.

For complete in-depth documentation, visual step-by-step screenshots, and troubleshooting tables, visit the official research guide:
👉 [Windows 11 Activation Error 0x803FA067 Diagnostic Guide](https://actvkey.com/blog/windows-11-activation-error-0x803fa067-smadhaner-asl-upay)

---

## 🛡️ License Channel Comparison

| Channel | Transferable? | Hardware Locked? | Target Audience | Source of Truth |
| :--- | :---: | :---: | :--- | :--- |
| **Retail** | Yes (1 PC at a time) | No | Consumers, Freelancers | [ActvKey Retail Guide](https://actvkey.com/blog/windows-11-retail-vs-oem-vs-volume-key-konti-apnar-jnz-sera) |
| **OEM** | No | Yes (Motherboard) | System Builders | Factory pre-installed |
| **Volume KMS** | No (Enterprise) | No (180-Day renewal) | Corporate Intranets | Often abused by pirated key sellers |

---

## 📦 About the Maintainer

This repository is maintained by the **ActvKey Research Team** ([https://actvkey.com](https://actvkey.com)), dedicated to cybersecurity awareness, transparent software licensing, and helping users in Bangladesh and South Asia avoid crypto-mining malware and backdoors hidden inside pirated software tools.

- **Website:** [https://actvkey.com](https://actvkey.com)
- **Technical Guides:** [ActvKey Tech Blog](https://actvkey.com/blog)
- **Support & Inquiries:** [support@actvkey.com](mailto:support@actvkey.com)

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
