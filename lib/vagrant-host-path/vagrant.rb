begin
  require 'vagrant'
rescue LoadError
  raise 'The Vagrant Host Path plugin must be run within Vagrant.'
end

module HostPath
  module Vagrant
    autoload :Config, 'vagrant-host-path/config'
    autoload :Env, 'vagrant-host-path/env'
  end
end

require 'vagrant-host-path/plugin'
