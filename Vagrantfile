Vagrant.configure("2") do |config|

  config.vm.define "master" do |master|
    config.vm.network "private_network", type: "dhcp"
    master.vm.box = "centos/7"
  end

  config.vm.define "slave1" do |slave|
    config.vm.network "private_network", type: "dhcp"
    slave.vm.box = "centos/7"
  end

  config.vm.define "slave2" do |slave|
    config.vm.network "private_network", type: "dhcp"
    slave.vm.box = "centos/7"
  end
end
