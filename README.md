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

