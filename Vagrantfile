Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/trusty64"
    config.vm.network :forwarded_port, guest: 80, host: 8080
    config.vm.network :private_network, ip: "192.168.33.10"
    config.vm.synced_folder "www/", "/var/www", owner: "www-data", group: "www-data", mount_options: ['dmode=777','fmode=666']
    config.vm.synced_folder "~", "/vagrant", owner: "vagrant", group: "vagrant"
    config.vm.provider "virtualbox" do |machine|
    	machine.memory = 1024
    	machine.name = "ubuntu-server-vagrant"
		machine.customize  ["modifyvm", :id, "--cpus", "1" ]
		machine.customize  ["modifyvm", :id, "--hwvirtex", "on"]		
		#machine.customize ["modifyvm", :id, "--vram", "12" ]
		#machine.customize ["modifyvm", :id, "--accelerate3d", "off"]
		#machine.customize ["modifyvm", :id, "--accelerate2dvideo", "off"]
    end
	
    config.vm.provision :shell, path: "setup.sh"
end