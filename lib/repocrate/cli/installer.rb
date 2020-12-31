require_relative "./operation"

class Installer < Operation
  def run
    @progress_bar.log "Installing crates"
    @configuration.content.each do |crate_name, config|
      @progress_bar.log "Check crate: #{crate_name}"
      crate_path = File.expand_path(config["crate"])
      if File.exists?(crate_path)
        @progress_bar.log "Crate: #{crate_name} exists"
        @progress_bar.increment
        next
      end

      installation_command = config["install_command"]
      unless installation_command
        @progress_bar.log "Crate: #{crate_name} is missing an installation command"
        @progress_bar.increment
        next
      end

      perform_task do
        Dir.chdir(File.expand_path("..", crate_path)) do
          system(installation_command)
        end
        post_install_command = config["post_install_command"]
        if post_install_command
          Dir.chdir(crate_path) do
          system(post_install_command)
          end
        end
      end
      @progress_bar.log "Crate: #{crate_name} has been installed"
      @progress_bar.increment
    end
    @progress_bar.log "==== All crates have been installed ===="
  end
end
