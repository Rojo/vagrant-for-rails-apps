
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.vm.define 'rails-apps-box'

  # Forward ports
  # 3000 - Rails Puma
  [3000].each do |p|
    config.vm.network :forwarded_port, guest: p, host: p
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1536']
  end

  ## If you are using Windows o Linux with an encrypted volume
  config.vm.synced_folder '.', '/vagrant', type: 'virtualbox'

  ## If you're using OS X or Linux (not encrypted)
  ## NFS improves speed of VM if supported by your OS
  # config.vm.network 'private_network', ip: '192.168.50.4'
  # config.vm.synced_folder '.', '/vagrant', type: 'nfs'

  # Provision box
  config.vm.provision "shell", privileged: false, run: "always",
    path: "provision/zsh_setup.sh"
  config.vm.provision "shell", privileged: false, run: "always",
    path: "provision/box_setup.zsh"
end
