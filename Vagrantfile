#
# refers:
#     - https://learn.hashicorp.com/collections/vagrant/getting-started
#     - https://www.vagrantup.com/docs/synced-folders/basic_usage
# boxes: https://app.vagrantup.com/boxes/search
#
Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"

    config.vm.provider "virtualbox" do |v|
        v.memory = 8192
        v.cpus = 8
    end

    config.vm.disk :disk, size: "100GB", primary: true

    config.vm.network "public_network"
    # config.ssh.username = 'vagrant'
    # config.ssh.password = 'vagrant'

    config.vm.provision :shell, path: "bootstrap.sh"

    config.vm.synced_folder "./scripts", "/home/vagrant/scripts"
    config.vm.synced_folder "./lede", "/home/vagrant/lede",
        type: "rsync", 
        rsync__exclude: [".git/", "build_dir/", "staging_dir/", "tmp/"],
        rsync__args: ["--archive", "--links", "--safe-links"]
    config.vm.synced_folder "./home", "/home/vagrant/",
        type: "rsync", 
        rsync__args: ["--archive", "--links", "--safe-links"]
end
