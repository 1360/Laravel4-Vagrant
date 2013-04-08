# Laravel 4 w/ Vagrant

A basic Ubuntu 12.04 Vagrant setup with [Laravel4](http://four.laravel.com) and PHP 5.4.


## Requirements

* VirtualBox - Free virtualization software [Downloads](https://www.virtualbox.org/wiki/Downloads)
** Install virtualbox https://www.virtualbox.org/

* Vagrant - Tool for working with virtualbox images [Vagrant Home](https://www.vagrantup.com), click on 'download now link'
** V1.1.5 download your flavor and install.

* Git - Source Control Management [Downloads](http://git-scm.com/downloads)



## Project Specific Setup


* Clone this repo `http://www.github.com/1360/Laravel4-Vagrant`
* Clone sims project repo into `Laravel4-Vagrant/www/` directory (if this step is skipped vagrant may error out.)
* cd back to `Laravel4-Vagrant/` and run run `vagrant up` from command line (allow firewall access if prompted. the first time you run vagrant it will need to fetch the virtual box image which is ~300mb so depending on your download speed this could take some time)
* Vagrant will then use puppet to provision the base virtual box with our LAMP stack (this could take a few minutes) also note that composer will need to fetch all of the packages defined in the app's composer.json which will add some more time to the first provisioning run
* ssh/putty into vagrant machine.
* in /var/www/ clone sims repo
* Run composer
* You can verify that everything was successful by opening http://localhost:8888 in a browser

web file on host machine in vagrant folder relative path www/
website http://localhost:8888/
phpmyadmin http://localhost:8888/phpmyadmin/ root/root

*Note: You may have to change permissions on the www/app/storage folder to 777 under the host OS* 

For example: `chmod -R 777 www/app/storage/`


### Using Vagrant

Vagrant is [very well documented](http://vagrantup.com/v1/docs/index.html) but here are a few common commands:

* `vagrant up` starts the virtual machine and provisions it
* `vagrant suspend` will essentially put the machine to 'sleep' with `vagrant resume` waking it back up
* `vagrant halt` attempts a graceful shutdown of the machine and will need to be brought back with `vagrant up`
* `vagrant ssh` gives you shell access to the virtual machine (gives connection info for putty on windows)
* `vagrant destroy` - removes the vm from your box (rebuild machine on next `vagrant up`)
* `vagrant reload` - reloads the virtual machine


##### Virtual Machine Specifications #####

* OS     - Ubuntu 12.04
* Apache - 2.2.22
* PHP    - 5.4.13
* MySQL  - 5.5.28