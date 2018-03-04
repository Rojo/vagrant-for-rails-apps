
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.vm.define 'rails-apps-box'

  # Forward ports
  [
    3000 # Rails Puma
  ].each do |p|
    config.vm.network :forwarded_port, guest: p, host: p
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1536']
  end

  # If you are using Windows or Linux (with an encrypted volume) stick with the
  # virtualbox syncronization. Unencrypted Linux and OSX can can get a better
  # file read/write performance by using SSHF or NFS.
  config.vm.synced_folder '.', '/vagrant', type: 'virtualbox'

  # Provision box
  config.vm.provision "shell", privileged: false, run: "once",
    path: "provision/zsh_setup.sh"
  config.vm.provision "shell", privileged: false, run: "once",
    path: "provision/box_setup.zsh",
    env: {
      "LC_ALL"   => "en_US.UTF-8",
      "LANG"     => "en_US.UTF-8",
      "LANGUAGE" => "en_US.UTF-8",
    }
end
