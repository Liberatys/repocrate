require_relative './progress'

class Updater
  def initialize(configuration)
    @progress_bar = Progress::Bar.new(configuration.content.length)
    @configuration = configuration
  end

  def suppress_output
    original_stdout, original_stderr = $stdout.clone, $stderr.clone
    $stderr.reopen File.new("/dev/null", "w")
    $stdout.reopen File.new("/dev/null", "w")
    yield
  ensure
    $stdout.reopen original_stdout
    $stderr.reopen original_stderr
  end

  def run
    @configuration.content.each do |crate_name, config|
      @progress_bar.log "Updating crate: #{crate_name}"
      suppress_output do
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
  end
end
