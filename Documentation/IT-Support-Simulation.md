# IT Support Simulation Project
**Designed and Implimented by:** Ryan Jackson
**Github Repo:** https://github.com/rjverses-boop/IT-Support-Project-Sim/tree/main
**Date:** *Jan/2026*

---

## Table of Contents
1. [Project Overview]
2. [Lab Environment & Architecture]
3. [Network Configuration]
4. [Active Directory Deployment]
5. [OU & GPO Design]
6. [User & Group Management]
7. [Powershell Automation]
8. [Simulated IT Support Tickets]
9. [Report & Logging]
11. [Key Learnings]

---

# Project Overview
This project is a simulation of a complete enterprise style IT support environment using VirtualeBox, Windows Server, and Windows 11 clients. The goal was to demonstrate hands-on skills relevant to IT Support, Help Desk, and Junior System Administration roles, including:

- Active Directory Deployment
- DNS & Networking
- User & Group Management
- Group Policy (GPO) configuration
- Security practices
- Powershell automation
- Realistic troubleshooting workflows

This environment mirrors what real companies use and serves as a practical showcase of technical ability, documentation skills, and problem-solving.

---

# Lab Environment & Architecture

### **VMs**
- **Windows Server 2025** (Domain Controller, DNS)
- **Windows 11 Clients 1&2**

### **Services & Roles Installed**
- Active Directory Domain Services (AD DS)
- DNS Server
- Group Policy Management

### **Network Diagram**

---

# Network Configuration

### **IP Scheme**
| Device | IP Address | Role |
|--------|------------|------|
| DC     | 192.168.10.10 | AD DS + DNS |
| Client 1 | 192.168.10.11 | Workstation |
| Client 2 | 192.168.10.12 | Workstation |

### **Description**
- Internal network used
- All clients configured to use **192.168.10.10** as DNS
- Verified connectivity with 'ping'

### **Screenshots**
<img width="682" height="292" alt="image" src="https://github.com/user-attachments/assets/1d3aaca0-7709-43df-bf4a-5a9654926f55" />
<img width="687" height="291" alt="image" src="https://github.com/user-attachments/assets/b2be88c3-e354-4b7f-9016-9dcaa141d289" />

---

# Active Directory Deployment

### Steps:
1. Install (ADDS) **Active Directory Domain Services**
2. Promote server to a Domain Controller
3. Create domain: **lab.local**
4. Configure DNS
5. Join Windows 11 clients to domain
6. Verify login with domain credentials

### **Screenshots**
<img width="844" height="613" alt="image" src="https://github.com/user-attachments/assets/733b323a-3413-4fab-a52f-3d90ac5a3a45" />
<img width="435" height="479" alt="image" src="https://github.com/user-attachments/assets/3d5c959c-ea11-4eb3-ade9-b414998be10b" />
<img width="424" height="484" alt="image" src="https://github.com/user-attachments/assets/b5b6a23c-eda3-40d0-8e43-3240cd2a15fc" />

---

### **GPOs Implimented**
- User - Disable Control Panel
- Security - Disable USB Storage
- Workstation - Windows Update Policy
- Domain - Password Policy

### **Screenshots**
<img width="1009" height="321" alt="image" src="https://github.com/user-attachments/assets/49bb2da5-ba03-4273-b9e1-f52184a390f6" />
<img width="748" height="479" alt="image" src="https://github.com/user-attachments/assets/b80c7980-4a59-4872-bf94-41dab64e5cc8" />

---

# User & Group Management

### **Tasks Completed**
- Created user accounts (Alice, Bob, Charlie)
- Created security groups (IT, HR, Finance)
- Applied NTFS permissions
- Tested user logins

### **Screenshots**
<img width="413" height="187" alt="Screenshot 2026-01-28 185525" src="https://github.com/user-attachments/assets/cb9ccc84-d376-44d0-b324-4ca56a7b5de3" />

# Powershell Automation

### **Scripts Implemented**
- OU created automation
- Bulk user creation (CSV import)
- Password policy configuration
- GPO Deployment
- Reporting(users, groups, logon attributes)

### Example:
```powershell
New-ADUser -Name "Alice Johnson" -SamAccountName "alice.j" -UserPrincipalName "alice.j@lab.local" `
-Path "OU=IT,DC=lab,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssword123" -AsPlainText -Force) `
-Enabled $true 

---

# Simulated IT Support Tickets

### **Ticket #1-Password Reset**
Problem: User unable to log in
Cause: expired Password
Solution: Reset password via ADUC and PowerShell
Set-ADAccountPassword -Identity "alice.j" -NewPassword (ConvertTo-SecureString "Temp123!" -AsPlainText -Force)

### **Ticket #2-Unresponsive Printer**
Problem: Client PC cant Printer
Cause: Missing driver
Solution: Reinstalled driver and restated spooler Services

### **Ticket #3-Software Install Request**
Problem: User needs Notepad++
Solution: Installed under elevated permissions

# Reports & Logging

### **Generated Reports**
User report (CSV)
Group membership report
logon time report

# Key Learnings
Deployed Active Directory from scratch
Designed scalable OU/GPO Architecture
Automated administative tasks using powershell
Troubleshot real-world issues
Documented work professionally

This project represents hands-on experience with enterprise IT workflows
