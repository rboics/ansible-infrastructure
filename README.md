# ansible-infrastructure
Ansible playbooks that automatically deploy the infrastructure used for RIT's 2017 GenCyber summer camp.

There are two components to this infrastructure: the core services offered to all floors of the hospital,
and the services specific to each floor. Because these components are vastly different, their configs and
playbooks have been separated into two different subdirectories. README files in each subdirectory describe
the contents of that subdirectory.

##What is Ansible?
Ansible is a lightweight automation engine that utilizes OpenSSH and Python for Linux, PowerShell 
remoting for Windows, and the vSphere API for VMware vSphere, to carry out sets of tasks called playbooks. 
The small amount of software needed to be installed on clients makes Ansible perfect for quick deployment 
of basic infrastructure, as some of these packages are already found by default in installations of these operating systems.

Playbooks are files that describe a series of tasks to be carried out on a given system. For instance, 
one could write a playbook that makes sure that every Linux server in a given set of hosts has an up-to-date 
installation of Nginx. These playbooks are written in YAML, which is a format that is meant to be human-readable. 
Each playbook has a group of hosts that it should be run against, specified by the hosts directive. 
All of the hosts that are managed by Ansible are kept in an inventory file, which is by default located in /etc/ansible/hosts.

Using Ansible with Linux
The first part of this demo focuses on the benefits that Ansible can offer for Linux. Ansible was originally developed with Unix/Linux systems in mind, and as such there are way more modules available than there are for Windows or vSphere. A full list of all the modules that Ansible supports can be found here. Almost any task needed to administer a Linux system is supported in an Ansible module, and if a module doesn’t exist for what you’re trying to do, you can use the raw or shell modules to execute commands directly on the remote system.
ssh-key.yml
Before jumping into the deployment side of things, it’s worth noting a few things about how Ansible handles the actual SSH connection itself. By default, Ansible will try to use whatever SSH keys are currently known to ssh-agent and the username that ran the playbook as credentials to log in to whatever hosts are in the playbook. Remember, this is why Ansible needs an SSH server to be installed on any *nix systems that it interacts with. This default login behavior can be modified using the -k and -u flags, which specify that an SSH password will be entered, and provides a username to login as, respectively. 

Ideally, key-based authentication will be used for every playbook. However, we don’t want to have to login to every single host we want to administer and transfer a key over. That’s where this playbook becomes useful.
 
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

Although there are a few things going on in this playbook, it is still pretty straightforward. This playbook takes the public key named “ansible.pub” located in the user’s .ssh directory and places it on the remote system as an authorized key for the user that they are logging in as. It will also install libselinux-python if run on a Red Hat-style system such as CentOS or Fedora, which is necessary to use the authorized_key module on those systems. The curly braces used in the user and key options mean to look for that value in a variable or to run a function at runtime to determine what it is. The lookup function simply gets all of the information from a given file and stores it, in this case, in the key variable. This is useful when a module requires a username and password to login with and you don’t want to store that information in plaintext.

The syntax to run this playbook is:
    ansible-playbook -i hosts -k -u [user] ssh-key.yml

Now that we have placed a key onto this system, we can do other administrative things with it.
InstallApache.yml
This playbook demonstrates installing Apache on the Ubuntu system, and then enabling it so the service starts when the system boots.

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

This playbook is very simple, but includes one new concept: the become directive. Installing Apache and enabling it to start on boot requires root privileges. However, it would be a bad idea to allow regular root logins to an SSH server. The become directive allows Ansible to use sudo in order to perform a task. In this case, the become directive is at the top of the playbook, so Ansible will “become” root before performing any tasks. The become directive requires the -K option, which will prompt for a password to give to sudo before running the playbook.

The syntax to run this playbook is:
    ansible-playbook -i hosts -K InstallApache.yml
Ansible Vaults
Before continuing into the Windows-specific playbooks, we should stop to discuss Ansible vaults. Often, Ansible playbooks will require using administrator-level privileges on another machine. *nix systems avoid the issue of having to write this information into a file by using keys, but Windows systems do not have this luxury. Using Ansible on Windows systems requires placing the username and password that Ansible must use into an inventory variable file, located in the group_vars directory, which is in the same directory as the playbook being run. Each group of Windows systems must have its own inventory variable file. For instance, using the hosts-secure inventory file provided in the repository, the group_vars/windows-dc.yml file would look like this:



These variables tell Ansible to log in to the windows-dc systems with the username Administrator, a password of P@ssw0rd123, and to use the Windows Remote Management interface on port 5986. It also tells Ansible to not worry about validating the remote system’s TLS certificate. Having to keep this information in a plaintext file is obviously not a good idea, especially if using a user with administrator privileges to log into these systems.

This is where Ansible vaults come into play. An Ansible vault is just a file that is encrypted using AES, which Ansible can then decrypt when running a playbook that needs information from that file.

Ansible vaults can be created from scratch using the ansible-vault create command. A file can also be encrypted as a vault by using the ansible-vault encrypt command. Both will ask you to enter a vault password, and then either open the vi editor to allow you to enter the information to be put into that vault, or will encrypt the already created file.

As we will see when running the Windows playbooks, ansible-playbook will decrypt any inventory variable files if the --ask-vault-pass option is passed when running a playbook that requires decrypting a vault to run.
Using Ansible with Windows
To run an Ansible playbook in Windows, Powershell must be updated to at least version 3, and this script must be run on the system. That script initializes the Windows Remote Management interface, which allows commands to be run remotely on a Windows machine.
InstallActiveDirectory.yml
This playbook focuses on installing Active Directory Domain Services on a system with at least Windows Server 2008 installed.

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

The syntax to run this playbook is:
ansible-playbook -i hosts-secure InstallActiveDirectory.yml --ask-vault-pass
PromoteDomainController.yml
This playbook is meant to be run right after InstallActiveDirectory.yml. This one is a bit long:

- hosts: windows-dc
  remote_user: Administrator
  tasks:
    - name: Ensure domain exists
      win_domain:
        dns_domain_name: rit.test
        safe_mode_password: P@ssw0rd123
      register: domain_result
    - name: Reboot the server if necessary
      win_reboot:
      when: domain_result.reboot_required
    - name: Promote to domain controller
      win_domain_controller:
        dns_domain_name: rit.test
        # Obviously, these credentials should never be used in a prod environment
        domain_admin_user: admin@rit.test
        domain_admin_password: P@ssw0rd123
        safe_mode_password: P@ssw0rd123
        state: domain_controller
        log_path: C:\ansible_promote.txt
    - name: Reboot the machine
    win_reboot:

This playbook uses the win_domain module to see if the rit.test domain exists, and if it doesn’t, it creates it in a new forest. This playbook introduces a new directive: the register directive. Modules can sometimes return values, which normally are just ignored by the next play. Using the register directive causes any return values from the last task to be put into a variable that can be referenced. This, in turn, is referenced in the win_reboot module using the when directive, which is used basically as an if statement. What this part of the playbook is doing is checking if the new domain was created, and if it was, rebooting the machine.

The rest of the playbook is fairly straightforward. After the domain stuff is settled, the server is promoted to a domain controller and rebooted.

The syntax to run this playbook is:
ansible-playbook -i hosts-secure PromoteDomainController.yml --ask-vault-pass

Once the domain controller has been promoted, we can move on to the last Windows playbook.
JoinDomain.yml
- hosts: windows-client
  tasks:
    - name: Point DNS at correct DNS server
      win_dns_client:
        adapter_names: "Local Area Connection"
        ipv4_addresses: 10.80.100.7
    - name: Join client to the rit.test domain
      win_domain_membership:
        dns_domain_name: rit.test
        hostname: client
        domain_admin_user: Administrator@rit.test
        domain_admin_password: P@ssw0rd123
        state: domain
      register: domain_state
    - name: Reboot client if necessary
      win_reboot:
      when: domain_state.reboot_required

This one is also fairly straightforward. The client has its DNS pointed at the domain controller so it can find the domain, in case it was using a different DNS server earlier. Next, the client is joined to the rit.test domain and has its hostname changed to client. Finally, like we saw before, the client is rebooted if necessary.

The syntax to run this playbook is:
ansible-playbook -i hosts-secure JoinDomain.yml --ask-vault-pass


