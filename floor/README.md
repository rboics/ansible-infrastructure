# Floor

The floor infrastructure consists of five Windows systems and one Linux system:
- A system running a base installation of Windows Server 2012 R2
- A system running Windows 7 SP1
- A system running Windows XP
- Two systems running Windows 10
- An [OSSIM](https://www.alienvault.com/products/ossim) installation

## Deploying the infrastructure

Because the infrastructure includes a Windows XP machine, which isn't supported by Ansible, this document will be split into two parts: the systems that can be managed by Ansible, and Windows XP.

### Ansible deployment

Before deploying, make sure that you have modified the inventory file to your liking. The number of floors doesn't matter, but make sure that each floor's number is set correctly in the floorX:vars section. Delete any floors from the inventory file that you don't intend to use. `nameserver_ip` is whatever IP address you gave the core DNS server.

Make sure that the mgmtadmin user exists on every host you want to deploy to and that it has the password "admin". If you are going to use a different username/password combination, be sure to update the inventory file. Keep in mind, the mgmtadmin user will not be created in this case.

Make sure WinRM is enabled before deploying. These commands will quickly enable WinRM on systems running at least Windows 8/Server 2012:

```
PS> Enable-PSRemoting -Force -SkipNetworkProfileCheck
PS> Set-Item wsman:\localhost\client\trustedhosts *
C:\> winrm set winrm/config/client/auth @{Basic="true"}
C:\> winrm set winrm/config/service/auth @{Basic="true"}
C:\> winrm set winrm/config/service @{AllowUnencrypted="true"}
```

To quickly enable WinRM on systems running Windows 7/Server 2008:
  - Make sure Service Pack 1 and .NET 4.0 are installed.
  - Upgrade PowerShell to version 3.0.
  - Make sure the account you're using to login has a password configured, and that the network profile for the firewall is not set to public.

```
C:\> reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f
C:\> shutdown -r -t 0
PS> Enable-PSRemoting -Force
PS> Set-Item wsman:\localhost\client\trustedhosts *
C:\> winrm set winrm/config/client/auth @{Basic="true"}
C:\> winrm set winrm/config/service/auth @{Basic="true"}
C:\> winrm set winrm/config/service @{AllowUnencrypted="true"}
```

If you are using a fresh installation of Windows 7, you may run into some glitches with WinRM. For Windows 7, install this hotfix: [KB2842230](https://support.microsoft.com/en-us/help/2842230/-out-of-memory-error-on-a-computer-that-has-a-customized-maxmemorypers). There is a resource limit that is set by Windows on shells, which can be customized. A bug in WinRM ignored that value, even if it was customized.

To deploy the infrastructure, run `ansible-playbook -i inventory main.yml`.

Because the floors just need users to be created, the playbooks for the floors are a bit simpler. Just like in the core infrastructure, every host is separated into roles and have glue playbooks (billing,mgmt,nursing,server,common.yml) that map each group of hosts to their roles.

The common role has two tasks: A user creation task that uploads a CSV containing all of the users and passwords used in the infrastructure, uploads and runs a PowerShell script that goes through this csv and creates the users, then deletes those files from the system. The second task updates their DNS config to point at the nameserver specified in the nameserver_ip variable.

The other roles simply elevate the following users:
  - All
    - ffinch
  - Billing
    - BillAdmin
  - Nursing
    - NRSadmin
    - eerickson

### Windows XP deployment

In order to simplify deploying to the Windows XP hosts, we created a .bat script that automatically creates every user and promotes the appropriate nursing users. Copy the user-create-xp.bat file over to the Windows XP machine and run it as Administrator.
