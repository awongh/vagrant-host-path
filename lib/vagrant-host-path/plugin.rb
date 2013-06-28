begin
  require "vagrant"
rescue LoadError
  raise "The vagrant-host-path plugin must be run within Vagrant."
end

# This is a sanity check to make sure no one is attempting to install
# this into an early Vagrant version.
if Vagrant::VERSION < "1.2.0"
  raise "The vagrant-host-path plugin is only compatible with Vagrant 1.2+"
end

module HostPath
  module Vagrant
    class Plugin < ::Vagrant.plugin("2")

      name "HostPath"
      description <<-DESC
      pass a filepath from the host to the vm and back
      DESC

      config( :hostpath ) do
        require_relative "config"
        Config
      end

      action_hook(:hostpath, :machine_action_up) do |hook|
        hook.append(Env)
      end

      action_hook(:hostpath, :machine_action_reload) do |hook|
        hook.append(Env)
      end
    end
  end
end
