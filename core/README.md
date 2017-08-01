# Core
The core infrastructure consists of five Linux servers:
  - A nameserver running BIND on CentOS 7
  - A mailserver on Debian 8 running:
    - Postfix 2.6.19
    - Procmail 3.23
    - Courier-IMAP
    - Horde Webmail Groupware 5.2.16
      - Horde_Crypt-2.7.5
  - A webserver running a LAMP stack on CentOS 6.5
    - Running the portal web application, repo can be found [here](https://www.github.com/RITGencyber/portal)
  - A server running a custom application on CentOS 7
    - Custom application is the [server component to a simulated heartbeat sensor](https://github.com/RITGenCyber/heartbeat-server) running on students' Raspberry Pi's
  - A fileserver on Ubuntu 12.04 running:
    - vsftpd 2.3.4 (compromised version)
    - Apache Tomcat

Each server's deployment is abstracted out into a role. The inventory file describing each group
is at core/inventory.

## Deploying the infrastructure
The core servers can be deployed by simply running this command: `ansible-playbook -i inventory -K main.yml`. You may optionally have to provide the -u option if using a specific user to login to the managed nodes.
The main.yml playbook calls the some playbooks called glue playbooks, which are the other playbooks that map the host groups in the inventory file to the appropriate roles. These are the fs, common, mail (etc) YAML files that are in the root of the repository.

Each role has several smaller playbooks that separately run the tasks needed to
set up that server. For example, the mail role contains tasks to install Bash, Courier-IMAP, Horde, Postfix, and Procmail. These playbooks can be found in each role's "tasks" folder.

Some roles also have configuration files relevant to that server's services. These can be found in the relevant role's "files" folder.
