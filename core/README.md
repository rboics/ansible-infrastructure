# Core
The core infrastructure consists of five Linux servers:
  - A nameserver running BIND on CentOS 7
  - A mailserver on Debian 8 running:
    - Postfix 2.6.19
    - Procmail 3.23
    - Courier-Imap
    - Horde Webmail Groupware 5.2.16
      - Horde_Crypt-2.7.5
  - A webserver running a LAMP stack on CentOS 6.5
    - Running the portal web application, repo can be found [here](https://www.github.com/RITGencyber/portal)
  - A server running a custom application on CentOS 7
    - Custom application is the server component to a simulated heartbeat sensor running on students' Raspberry Pi's
  - A fileserver on Ubuntu 12.04 running:
    - vsftpd 2.3.4 (compromised version)
    - Apache Tomcat

Each server's deployment is abstracted out into a role. The inventory file describing each group
is at core/inventory. 

## Deploying the infrastructure
The core servers can be deployed by simply running this command: `ansible-playbook -K main.yml`
The main.yml playbook calls the "glue playbooks", which are the other playbooks named for each
role and maps the host groups in the inventory file to the appropriate roles.
