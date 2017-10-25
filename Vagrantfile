VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  config.vm.define :node01 do |node01|
    node01.vm.hostname = "isubata-01"
    node01.vm.network :private_network, ip: "192.168.56.101"
    node01.vm.network :private_network, ip: "10.0.0.101", virtualbox__intnet: "isucon_net"
    node01.vm.box_url = "https://storage.googleapis.com/vagrantbox/isucon7/app-isucon7.box"
    node01.vm.box = "ubuntu/appisucon7"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    end
  end
  config.vm.define :node02 do |node02|
    node02.vm.hostname = "isubata-02"
    node02.vm.network :private_network, ip: "192.168.56.102"
    node02.vm.network :private_network, ip: "10.0.0.102", virtualbox__intnet: "isucon_net"
    node02.vm.box_url = "https://storage.googleapis.com/vagrantbox/isucon7/app-isucon7.box"
    node02.vm.box = "ubuntu/appisucon7"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    end
  end
  config.vm.define :node03 do |node03|
    node03.vm.hostname = "isubata-03"
    node03.vm.network :private_network, ip: "192.168.56.103"
    node03.vm.network :private_network, ip: "10.0.0.103", virtualbox__intnet: "isucon_net"
    node03.vm.box_url = "https://storage.googleapis.com/vagrantbox/isucon7/db-isucon7.box"
    node03.vm.box = "ubuntu/dbisucon7"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    end
  end
  config.vm.define :node04 do |node04|
    node04.vm.hostname = "isubata-01"
    node04.vm.network :private_network, ip: "192.168.56.110"
    node04.vm.box_url = "https://storage.googleapis.com/vagrantbox/isucon7/bench-isucon7.box"
    node04.vm.box = "ubuntu/benchisucon7"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "8192"
      vb.cpus = 2
    end
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    end
  end
end
