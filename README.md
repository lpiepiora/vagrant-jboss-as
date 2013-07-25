Vagrant JBoss 7.1.x
======================

This is the simple vagrant setup installing Java 7 and JBoss 7.1.x on Ubuntu Precise 64

## How to Start

1. Install [VirtualBox](https://www.virtualbox.org/)
1. Install [Vagrant](http://www.vagrantup.com/)
2. Install [Salty Vagrant](https://github.com/saltstack/salty-vagrant) (`vagrant plugin install vagrant-salt`)
3. Startup Vagrant by executing `vagrant up`
4. Connect to the server by executing `vagrant ssh`

## Notes

JBoss is installed to `/opt/jboss-as` directory, and it is run with `jboss-as` user's permissions.

## Dependencies:

* [Salty Vagrant](https://github.com/saltstack/salty-vagrant)
* [SaltStack](http://saltstack.com/community.html)
* [WebUpd8 Java PPA](https://launchpad.net/~webupd8team/+archive/java)


