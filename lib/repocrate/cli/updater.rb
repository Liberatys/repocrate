require_relative "./operation"

class Updater < Operation
  def run
    @progress_bar.log "Updating crates"
    @configuration.content.each do |crate_name, config|
      @progress_bar.log "Updating crate: #{crate_name}"
      perform_task do
        branch = config["branch"]
        crate_path = File.expand_path(config["crate"])
        update_command = config["update_cmd"]
        build_command = config["build_cmd"]
        post_build_command = config["post_build_cmd"]
        Dir.chdir(crate_path) {
          if branch
            system("git checkout #{branch}")
          end
          if update_command
            system(update_command)
          end
          if build_command
            system(build_command)
          end
          if post_build_command
            system(post_build_command)
          end
        }
      end
      @progress_bar.increment
    end
    @progress_bar.log "==== All crates have been updated ===="
  end
end
