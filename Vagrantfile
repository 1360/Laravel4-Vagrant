# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.provider "virtualbox" do |v, override|
        override.vm.box = "precise32"
        override.vm.box_url = "http://files.vagrantup.com/precise32.box"
        v.customize [
                                "modifyvm", :id,
                                "--rtcuseutc", "on",
                                "--memory", 2048,
                                "--cpus", 1
                                ]
    end

    config.vm.define :laravel4 do |lv4_config|

        lv4_config.vm.network "forwarded_port", guest: 80, host:8888
        lv4_config.vm.network "forwarded_port", guest: 88, host:8887
        lv4_config.vm.network "forwarded_port", guest: 3306, host:8889

        lv4_config.vm.hostname = "laravel"
  		lv4_config.vm.synced_folder("www", "/var/www")

  		lv4_config.vm.provision :shell, :inline => "echo \"America/New_York\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

        lv4_config.vm.provision :puppet do |puppet|
            puppet.manifests_path = "puppet/manifests"
            puppet.manifest_file  = "phpbase.pp"
            puppet.module_path = "puppet/modules"
            #puppet.options = "--verbose --debug"
            #puppet.options = "--verbose"
        end

        lv4_config.vm.provision :shell, :path => "puppet/scripts/enable_remote_mysql_access.sh"
    end

end
