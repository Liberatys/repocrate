require "repocrate/version"
require "repocrate/cli/updater"
require "repocrate/cli/installer"
require "repocrate/cli/configuration"
require 'repocrate/version'

module Repocrate
  class Error < StandardError; end

  class CLI
    def self.start
      require 'commander/import'
      program :version, Repocrate::VERSION
      program :description, 'repocrate'

      configuration = Configuration.new(File.expand_path("~/.config/repocrate/conf.toml"))
      configuration.load
      
      command 'install'.to_sym do |c|
        c.syntax = 'repocrate install'
        c.summary = 'Install all crates defined in your config file that are not found in the crate directory'
        c.description = 'Reinstall all missing crates in the config file'
        c.action do |args, options|
          Installer.new(configuration).run
        end
      end

      command 'sync'.to_sym do |c|
        c.syntax = 'repocrate sync'
        c.summary = 'Install and update all crates'
        c.description = 'Install and update all crates'
        c.action do |args, options|
          Installer.new(configuration).run
          Updater.new(configuration).run
        end
      end
        
      command 'update'.to_sym do |c|
        c.syntax = 'repocrate update [options]'
        c.summary = 'Update crates defined in the configuration file'
        c.description = 'Update crates defined in the configuration file'
        c.option '--file', 'Set the path to the configuration file'
        c.option '-f', 'Set the path to the configuration file'
        c.action do |args, options|
          Updater.new(configuration).run
        end
      end
    end
  end
end
