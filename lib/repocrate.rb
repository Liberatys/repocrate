require "repocrate/version"
require "repocrate/cli/updater"
require "repocrate/cli/configuration"
require 'repocrate/version'

module Repocrate
  class Error < StandardError; end

  class CLI
    def self.start
      require 'commander/import'
      program :version, Repocrate::VERSION
      program :description, 'repocrate'

      configuration = Configuration.new("/Users/romanicus/.config/repocrate/conf.toml")
      configuration.load

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
