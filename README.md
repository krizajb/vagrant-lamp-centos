# Vagrant LAMP Stack

## Software
- Centos 7.4.1708
- Apache 2.4.6
- MySQL 5.7.22
- PHP 7.2.5
- phpMyAdmin 4.4.15.10 
- craftcms3 3.0.5

> Software versions can be as stated or higher.

## Usage

Manually install [Vagrant](https://www.vagrantup.com) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads).

Install [`vagrant-vbguest`](https://github.com/dotless-de/vagrant-vbguest) plugin:

```bash
$ vagrant plugin install vagrant-vbguest
```

Download/Clone the repo:
- Download [`zip`](../../archive/master.zip)
- Clone `$ git clone https://github.com/krizajb/vagrant-lamp-centos.git .`

Create and configure LAMP guest machine:
```bash
$ vagrant up
```

Once the VM is up, you can ssh into the current running Vagrant box:
```bash
$ vagrant ssh
```
You are now connected to the Vagrant box at `/home/vagrant`.

## Synced folders
- `webroot` (`/opt/webroot/`)
- `webroot/test.devel` (`/opt/webroot/test.devel/`)
- `webroot/cms/web` (`/opt/webroot/craftcms/web/`)
- `webroot/cms/web-foo` (`/opt/webroot/craftcms/web-foo/`)
- `webroot/cms/web-bar` (`/opt/webroot/craftcms/web-bar/`)


> Synced folders enable Vagrant to sync a folder on the host machine to the guest machine, allowing you to continue working on your project's files on your host machine, but use the resources in the guest machine to compile or run your project.

## Demo pages

On the “host” computer (i.e. **NOT** the VM), add these lines to your hosts file:

```text
10.10.0.20 webroot
10.10.0.20 test.devel
10.10.0.20 craftcms
10.10.0.20 craftcmsfoo
10.10.0.20 craftcmsbar
```
Access:
- <http://webroot>
- <http://test.devel>
- <http://craftcms>
- <http://webroot/phpmyadmin>

Craft3 pre-setup sites:
- <http://craftcmsfoo>
- <http://craftcmsbar>

> Those sites are not configured in craft3, they serve only as an example but can also be used.

# Username/Password:
VM:
- username: root
- password: vagrant

Craft3:
- username: admin
- password: admin3

phpMyAdmin, MySQL:
- passwordless access 
