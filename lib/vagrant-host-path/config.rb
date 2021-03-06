module Vagrant
  module HostPath
    class Config < Vagrant::Config::Base
      attr_writer :env_key
      attr_writer :path_file
      attr_writer :profile_path
      attr_writer :temp_upload_path

      def env_key
        @env_key || "VAGRANT_HOST_PATH"
      end

      def path_file
        @path_file || "/tmp/.vagrant-host-path"
      end

      def profile_path
        @profile_path || "/etc/zsh/zprofile"
      end
      
      def temp_upload_path
        @temp_upload_path || "/tmp/vagrant-host-path-profile.sh"
      end
    end
  end
end
