# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "mesos-master" do |master|
    master.vm.box = "ubuntu/xenial64"
    master.vm.network "private_network", ip: "10.111.111.10"
    master.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    master.vm.provision "shell", path: "master.sh"
  end

  config.vm.define "mesos-agent1" do |agent|
    agent.vm.box = "ubuntu/xenial64"
    agent.vm.network "private_network", ip: "10.111.111.11"
    agent.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    agent.vm.provision "shell", path: "agent1.sh"
  end

  config.vm.define "mesos-agent2" do |agent|
    agent.vm.box = "ubuntu/xenial64"
    agent.vm.network "private_network", ip: "10.111.111.12"
    agent.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    agent.vm.provision "shell", path: "agent2.sh"
  end

end
