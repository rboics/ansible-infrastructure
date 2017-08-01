# 2017 RIT GenCyber Summer Camp Ansible Playbooks

This project contains Ansible playbooks that automatically deploy the infrastructure used for RIT's 2017 GenCyber summer camp, as well as some documents that describe what Ansible is, how it works, and how to deploy the infrastructure using Ansible.

There are two components to this infrastructure: the core services offered to all floors of the hospital,
and the services specific to each floor. Because these components are vastly different, their configs and
playbooks have been separated into two different subdirectories. README files in each subdirectory describe
the contents of that subdirectory.

The rest of this document acts as a tutorial on basic Ansible topics and provides a few example playbooks to explain these topics.

## What is Ansible?
Ansible is a lightweight automation engine that utilizes OpenSSH and Python for Linux and PowerShell
remoting for Windows to carry out sets of tasks called playbooks.
The small amount of software needed to be installed on clients makes Ansible perfect for quick deployment
of basic infrastructure, as some of these packages are already found by default in installations of these operating systems.

Playbooks are files that describe a series of tasks to be carried out on a given system. For instance,
one could write a playbook that makes sure that every Linux server in a given set of hosts has an up-to-date
installation of Nginx, a popular webserver. These playbooks are written in YAML (YAML Ain't Markup Language), which is a format that is meant to be human-readable.
Each playbook has a group of hosts that it should be run against, specified by the hosts directive.
All of the hosts that are managed by Ansible are kept in an inventory file, which is by default located in /etc/ansible/hosts.

## Using Ansible with Linux
Ansible was originally developed with Unix/Linux systems in mind, and as such there are way more modules available than there are for Windows. A full list of all the modules that Ansible supports can be found [here](http://docs.ansible.com/ansible/latest/modules_by_category.html). Almost any task needed to administer a Linux system is supported in an Ansible module, and if a module doesn’t exist for what you’re trying to do, you can use the raw or shell modules to execute commands directly on the remote system.

### Linux Ansible requirements
The control machine, which is where you will actually run the ansible-playbook commands, must have Python 2.7 and the ansible package installed. Currently Ansible only supports using Linux as a control machine.

For the hosts you will be managing with Ansible, Ansible requires an SSH server and at least Python 2.2 to be installed.

### ssh-key.yml
Before jumping into the actual playbooks, it’s worth noting a few things about how Ansible handles the actual SSH connection itself. By default, Ansible will try to use whatever SSH keys are currently known to ssh-agent and the username of the user that is running the playbook as credentials to log in to whatever hosts are referenced in the playbook. Remember, this is why Ansible needs an SSH server to be installed on any \*nix systems that it interacts with. This default login behavior can be modified using the -k and -u flags, which specify that an SSH password will be entered, and provides a username to login as, respectively.

Ideally, key-based authentication will be used for every playbook. However, we don’t want to have to login to every single host we want to administer and transfer a key over. That’s where this playbook becomes useful.

```yaml
- hosts: all
  vars:
      pubkey: ~/.ssh/ansible.pub
  tasks:
    - name: Add libselinux-python if RHEL
      yum:
        name: libselinux-python
        state: present
      when: ansible_os_family == "RedHat"
      become: true
    - name: Add local SSH key as authorized key for current user
      authorized_key:
          user: "{{ ansible_user }}"
          state: present
          key: "{{ lookup('file', '{{ pubkey }}') }}"
```

Although there are a few things going on in this playbook, it is still pretty straightforward. This playbook takes the public key named “ansible.pub” located in the user’s .ssh directory and places it on the remote system as an authorized key for the user that they are logging in as. It will also install libselinux-python if run on a Red Hat-style system such as CentOS or Fedora, which is necessary to use the authorized_key module on those systems. The curly braces are used when you need to pull in information from a variable. The ansible_user variable corresponds to the user that Ansible used to login to this host, in this case whatever user you gave to the -u argument. The lookup function gets the contents of given file, which is then handed to the key option.

The syntax to run this playbook is:

```bash
  ansible-playbook -i hosts -k -u [user] ssh-key.yml
```

Now that we have placed a key onto this system, we can do other administrative things with it.

### InstallApache.yml
This playbook demonstrates installing Apache on an Ubuntu system, and then enabling it so the service starts when the system boots.

```yaml
- hosts: ubuntu
  become: true
  tasks:
    - name: Install Apache (or upgrade it to the latest version if present)
      package:
        name: apache2
        state: latest
    - name: Enable Apache so it automatically comes up when the server reboots
      service:
        name: apache2
        enabled: yes
        state: started
```

This playbook is very simple, but includes one new concept: the become directive. Installing Apache and enabling it to start on boot requires root privileges. However, it would be a bad idea to allow regular root logins to an SSH server. The become directive allows Ansible to use sudo in order to perform a task. In this case, the become directive is at the top of the playbook, so Ansible will “become” root and perform every task in the playbook as root. The become directive requires the -K option, which will prompt for a password to give to sudo before running the playbook.

The syntax to run this playbook is:

```bash
    ansible-playbook -i hosts -K InstallApache.yml
```

## Using Ansible with Windows

### Ansible Vaults

Because Ansible does not use agents, you need to provide Ansible with some way to login to a system. \*nix systems avoid the issue of having to write a username and a password into a file by using keys, but Windows systems do not support key-based authentication. So, we must provide a username and password to Ansible to use to login to a Windows system. The easiest way to pass a username and password to Ansible is to use an inventory variable file. An inventory variable file is a file that links variables and their values to a specific host. By default, these files are located in the group_vars directory, which should be created in the same directory as the playbook being run. Each group of hosts that is targeted by an Ansible playbook should have its own inventory variable file. For instance, if you have two groups of Windows systems called "windows-dc" and "windows-client", then you would have a windows-dc.yml file and a windows-client.yml file in the group_vars directory.
Let's take a look at what the windows-dc.yml file would look like:

```yaml
ansible_connection=winrm
ansible_user=Administrator
ansible_password=P@ssw0rd123
ansible_port=5985
ansible_winrm_server_cert_validation=ignore
```

These variables tell Ansible to log in to the windows-dc systems with the username Administrator, a password of P@ssw0rd123, and to use the Windows Remote Management interface on port 5985. It also tells Ansible to not worry about validating the remote system’s TLS certificate. Having to keep this information in a plaintext file is obviously not a good idea, especially if using a user with administrator privileges to log into these systems.

This is where Ansible vaults come into play. An Ansible vault is just a file that is encrypted using AES, which Ansible can then decrypt when running a playbook that needs information from that file.

Ansible vaults can be created from scratch using the ```ansible-vault create``` command. A file that already exists can be encrypted as a vault by using the ```ansible-vault encrypt``` command. Both will ask you to enter a vault password, and then either open the vi editor to allow you to enter the information to be put into that vault, or will encrypt the file.

As we will see when running the Windows playbooks, ansible-playbook will decrypt any inventory variable files if the --ask-vault-pass option is passed when running a playbook that requires decrypting a vault to run.

### Windows Ansible requirements

To run an Ansible playbook in Windows, Powershell must be updated to at least version 3, and this script must be run on the system. Because of this, the oldest supported versions of Windows that Ansible supports are Windows 7 and Windows Server 2008 SP2. Windows Remote Management must also be configured on the machine. A more detailed tutorial on how to easily setup WinRM can be found in the [README file](https://github.com/RITGenCyber/ansible-infrastructure/tree/master/floor) found in the floor directory in this repository.

However, these commands will quickly enable WinRM on systems running at least Windows 8/Server 2012:

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

### InstallActiveDirectory.yml
This playbook focuses on installing Active Directory Domain Services on a system with at least Windows Server 2008 installed.

```yaml
- hosts: windows-dc
  remote_user: Administrator
  tasks:
    - name: Install AD DS.
      win_feature:
        name: AD-Domain-Services
        include_management_tools: True
        state: present
    - name: Reboot the machine.
    win_reboot:
```

The syntax to run this playbook is:

```
ansible-playbook -i hosts-secure InstallActiveDirectory.yml --ask-vault-pass
```

### PromoteDomainController.yml
This playbook is meant to be run right after InstallActiveDirectory.yml. This one is a bit long:

```yaml
- hosts: windows-dc
  remote_user: Administrator
  tasks:
    - name: Ensure domain exists
      win_domain:
        dns_domain_name: example.test
        safe_mode_password: P@ssw0rd123
      register: domain_result
    - name: Reboot the server if necessary
      win_reboot:
      when: domain_result.reboot_required
    - name: Promote to domain controller
      win_domain_controller:
        dns_domain_name: example.test
        domain_admin_user: admin@example.test
        domain_admin_password: P@ssw0rd123
        safe_mode_password: P@ssw0rd123
        state: domain_controller
        log_path: C:\ansible_promote.txt
    - name: Reboot the machine
    win_reboot:
```

This playbook uses the win_domain module to see if the example.test domain exists, and if it doesn’t, it creates it in a new forest. This playbook introduces a new directive: the register directive. Modules can sometimes return values, which normally are just ignored by the next play. Using the register directive causes any return values from the last task to be put into a variable that can be referenced. This, in turn, is referenced in the win_reboot module using the when directive. The when directive acts like an if statement: the server will only reboot if domain_result.reboot_required is true. What this part of the playbook does is check if the new domain was created, and if it was, it reboots the machine.

The rest of the playbook is fairly straightforward. After the domain stuff is settled, the server is promoted to a domain controller, a domain user is created, and the server is rebooted. The actions taken are logged to C:\ansible_promote.txt.

The syntax to run this playbook is:

```
ansible-playbook -i hosts-secure PromoteDomainController.yml --ask-vault-pass
```

Once the domain controller has been promoted, we can move on to the last Windows playbook.

### JoinDomain.yml

```yaml
- hosts: windows-client
  tasks:
    - name: Point DNS at correct DNS server
      win_dns_client:
        adapter_names: "Local Area Connection"
        ipv4_addresses: 192.168.1.100 # IP address of the domain controller
    - name: Join client to the example.test domain
      win_domain_membership:
        dns_domain_name: example.test
        hostname: client
        domain_admin_user: Administrator@example.test
        domain_admin_password: P@ssw0rd123
        state: domain
      register: domain_state
    - name: Reboot client if necessary
      win_reboot:
      when: domain_state.reboot_required
```

This one is also fairly straightforward. The client has its DNS pointed at the domain controller so it can find the domain, in case it was using a different DNS server earlier. Next, the client is joined to the example.test domain and has its hostname changed to client. Finally, like we saw before, the client is rebooted if necessary.

The syntax to run this playbook is:
```
ansible-playbook -i hosts-secure JoinDomain.yml --ask-vault-pass
```
