# -*- mode: ruby -*-
# vi: set ft=ruby :
# All Vagrant configuration is done here. For a complete reference,
# please see the online documentation at vagrantup.com.

VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.7.2"

#detect envirinmnet variables
host_os = RbConfig::CONFIG['host_os']
vagrant_command = ARGV[0]

if vagrant_command == "up"
    # check and install required Vagrant plugins
	required_plugins = %w( vagrant-vbguest vagrant-cachier vagrant-hostsupdater vagrant-host-shell )
	required_plugins.each do |plugin|
		unless Vagrant.has_plugin?(plugin)
			system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
		end
	end
	# install nfs-kernel-server in Linux to support synced_folder via nfs
    if host_os =~ /linux/
    	system "sudo apt-get install nfs-kernel-server nfs-common rpcbind"
    end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.boot_timeout = 300
  config.vm.provider "virtualbox" do |vb|
  	vb.gui = false
  end

  config.vm.define "yii2advanced" do |yii2advanced|
	yii2advanced.vm.box = "yii2advanced"
	# Configure some Virtual Box params
	yii2advanced.vm.provider :virtualbox do |yii2advanced|
		yii2advanced.customize ["modifyvm", :id, "--name", "Yii2 Advanced"]
		yii2advanced.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
		yii2advanced.customize ["modifyvm", :id, "--memory", "1500"]
		yii2advanced.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
		yii2advanced.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        yii2advanced.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
		# Set VirtualBox guest CPU count to the number of host cores
		if host_os =~ /linux/
        	yii2advanced.customize ["modifyvm", :id, "--cpus", `grep "^processor" /proc/cpuinfo | wc -l`.chomp ]
        end
	end
	yii2advanced.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
        yii2advanced.vm.network "private_network", ip: "191.0.10.10"
        yii2advanced.vm.network "forwarded_port", guest: 80, host: 8088

		#share synced_folder via nfs for Mac nd Linux
        if host_os =~ /linux/ or host_os =~ /darwin/
			yii2advanced.vm.synced_folder "/var/www/yii2-advanced", "/var/www/yii2-advanced", mount_options: ["rw", "tcp", "nolock", "noacl", "async"], type: "nfs", version: 3, nfs_udp: 0
        else
			yii2advanced.vm.synced_folder "/var/www/yii2-advanced", "/var/www/yii2-advanced", owner: "www-data", group: "www-data"
        end

        # PLUGINS
        # Set entries in hosts file
        # https://github.com/cogitatio/vagrant-hostsupdater
        if Vagrant.has_plugin?("vagrant-hostsupdater")
          yii2advanced.hostsupdater.remove_on_suspend = true
          yii2advanced.vm.hostname = "191.0.10.10.xip.io"
        end
        if Vagrant.has_plugin?("vagrant-cachier")
          yii2advanced.cache.auto_detect = true
        end

		# PROVISIONING
		# Ansible
		# To use Ansible provisioning you should have Ansible installed on your host machine
		# see here http://docs.ansible.com/intro_installation.html#installing-the-control-machine
		yii2advanced.vm.provision "ansible" do |ansible|
			# should be equal to host name in Ansible hosts file
            ansible.limit = "dev"
            ansible.playbook = "build/ansible/dev.yml"
            ansible.inventory_path = "build/ansible/dev"
            # set to 'vvvv' for debug output in case of problems or leave it false
            ansible.verbose = 'vvvv'
            ansible.sudo = true
		end

  end

end
