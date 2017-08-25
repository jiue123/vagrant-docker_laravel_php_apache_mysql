Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.ssh.insert_key = false

  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = true
  end

  config.vm.network "forwarded_port", guest: 80, host: 8089
  config.vm.network "private_network", ip: "192.168.33.19"
  config.vm.network "public_network"
  
  config.vm.synced_folder ".", "/vagrant", mount_options: ['dmode=777','fmode=777'], type: "virtualbox"
  config.vm.synced_folder ".", "/var/www/web", mount_options: ['dmode=777','fmode=777'], type: "virtualbox"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.cpus = 2
    vb.memory = "2048"
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.vm.provision "shell", path: "provision.sh"
end