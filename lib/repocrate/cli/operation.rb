require_relative './progress'

class Operation
  
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

  def perform_task
    suppress_output do
      yield
    end
  end
end
