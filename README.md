# IT Support Simulation Project (Home Lab)

## Overview
This project is a simulation of a real-world IT support environment using my virtual home lab, demonstrating core IT skills such as:
- Active Directory setup
- User and group management
- Password policies
- Group Policy configuration
- Simulated ticket resolution
- Automation with PowerShell

**Goal:** Prove ability to perform IT support tasks from day one.

---

## Lab Setup
- **Virtualization Software:** VirtualBox / VMware Workstation Player
- **Operating Systems:**
  - Windows Server 2025 (Domain Controller)
  - Windows 11 (2 client machines)
- **Network Configuration:** Internal Network with static IPs

---

## Features Implemented
- **Active Directory Domain Services (AD DS)**
- **User Creation & Permissions**
- **Password Policies**
- **Group Policy Objects (GPO)**
- **Simulated IT Support Tickets**
- **PowerShell Automation**

---

## Project Structure
📁 IT-Support-Sim
│── 📄 README.md
│── 📁 Screenshots
│── 📁 PowerShell-Scripts
│   │── Basic-Tasks.ps1
│   │── Advanced-Reporting.ps1
│── 📁 Reports
│   │── ADUserReport.csv
│   │── ADGroupMembership.csv
│── 📁 Documentation
│   │── IT-Support-Simulation.pdf

---

## PowerShell Automation Highlights
- **Bulk User Creation**
- **Password Policy Configuration**
- **GPO Deployment**
- **User & Group Reports**
- **Scheduled Reporting**

Example:
```powershell
# Export all AD users with key attributes to CSV
Get-ADUser -Filter * -Property DisplayName,Department,EmailAddress,LastLogonDate |
Select-Object DisplayName,Department,EmailAddress,LastLogonDate |
Export-Csv "C:\ADUserReport.csv" -NoTypeInformation
