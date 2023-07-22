Vagrant.require_version ">= 1.4.3"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	# config proxy, require vagrant-proxyconf plugin "vagrant plugin install vagrant-proxyconf" , can comment if not needed
	config.proxy.http     = ENV["http_proxy_vagrant"]
	config.proxy.https    = ENV["https_proxy_vagrant"]
	config.proxy.no_proxy = ENV["no_proxy"]
	numNodes = 5
	r = numNodes..1
	(r.first).downto(r.last).each do |i|
		config.vm.define "node#{i}" do |node|
			#node.vm.box = "chef/centos-6.5"
			node.vm.box = "centos7"
			node.vm.box_url = "file:///C:/Users/RNT9HC/Documents/SoftwareOutside/CentOS-7-x86_64-Vagrant-1905_01.VirtualBox.box"
			node.vm.provider "virtualbox" do |v|
			  v.name = "node#{i}"
			  v.customize ["modifyvm", :id, "--memory", "2048"]
			end
			if i < 10
				node.vm.network :private_network, ip: "10.211.55.10#{i}"
			else
				node.vm.network :private_network, ip: "10.211.55.1#{i}"
			end
			node.vm.hostname = "node#{i}"
			node.vm.provision "shell", path: "scripts/setup-centos.sh"
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-centos-hosts.sh"
				s.args = "-t #{numNodes}"
			end
			if i == 2
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-centos-ssh.sh"
					s.args = "-s 3 -t #{numNodes}"
				end
			end
			#Setting up mysql server
			if i == 2
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-mysql.sh"
				end
			end

			if i == 1
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-centos-ssh.sh"
					s.args = "-s 2 -t #{numNodes}"
				end
			end
			node.vm.provision "shell", path: "scripts/setup-java.sh"
			node.vm.provision "shell", path: "scripts/setup-hadoop.sh"
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-hadoop-slaves.sh"
				#s.args = "-s 3 -t #{numNodes}"
				#Changing all nodes as slave nodes. Uncomment above line if you want to keep namenode, yarn as separate VM
				s.args = "-s 2 -t #{numNodes}"
			end
			#Setup spark
			node.vm.provision "shell", path: "scripts/setup-spark.sh"
			node.vm.provision "shell" do |s|
				s.path = "scripts/setup-spark-slaves.sh"
				s.args = "-s 2 -t #{numNodes}"
			end
			#Setup pig & hive client in datanodes
			if i > 1
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-hive.sh"
				end
			end

			if i > 1
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-pig.sh"
				end
			end

			if i == 1
				node.vm.provision "shell" do |s|
					s.path = "scripts/setup-namenode.sh"
				end
			end

		end
	end
end
