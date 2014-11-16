## Riddler - A CentOS basebox for LAMP development

This is a minimal CentOS 7 basebox for use with Vagrant.

### Features
* Builds from the minimal image for CentOS 7.0 but results in an up to date installation.
* Minimal package set while still useful.
* For LAMP development includes Apache, MariaDB, PHP and extensions.
* Latest Guest Additions installed.
* No X.
* Minimized image with no swap partition included, log files removed, etc.
* Defaults are easily modifiable via `ks.cfg` or scripts.

### Defaults
* `en_US.UTF-8` is the default language.
* `es` keyboard layout.
* `America/Bogota` timzone.
* `vagrant` user with password `vagrant`. This user has sudo permissions and the Vagrant SSH key installed.
* root and MySQL password is `vagrant`.

### Requirements (for building the basebox)
* An internet connection (duh).
* [Oracle VM VirtualBox](http://www.virtualbox.org).
* [Packer](http://www.packer.io).
