# Floor

The floor infrastructure consists of five Windows systems and one Linux system:
- A system running a base installation of Windows Server 2012
- A system running Windows 7 SP1
- A system running Windows XP
- Two systems running Windows 10
- An [OSSIM](https://www.alienvault.com/products/ossim) installation

## Deploying the infrastructure

Because the infrastructure includes a Windows XP machine, which isn't supported by Ansible, this document will be split into two parts: the systems that can be managed by Ansible, and Windows XP.

### Ansible deployment

Before deploying, make sure that you have modified the inventory file to your liking. The number of floors doesn't matter, but make sure that each floor's number is set correctly in the floorX:vars section. Delete any floors from the inventory file that you don't intend to use. `nameserver_ip` is whatever IP address you gave the core DNS server.

Make sure that the mgmtadmin user exists on every host you want to deploy to and that it has the password "admin". If you are going to use a different username/password combination, be sure to update the inventory file. Keep in mind, the mgmtadmin user will not be created in this case.

To deploy the infrastructure, run `ansible-playbook -i inventory main.yml`.

Because the floors just need user management, the playbooks for the floors are a bit simpler. Just like in the core infrastructure, every host is separated into roles and have glue playbooks (billing,mgmt,nursing,server,common.yml) that map each group of hosts to their roles.

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
