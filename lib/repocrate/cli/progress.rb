require 'ruby-progressbar'
module Progress

  class Bar

    def initialize(task_count)
      @current = 0
      @module = ProgressBar::Base.new(:total => task_count, :length => 50)
    end

    def increment
      @module.increment
    end
    
    def log(message)
      @module.log message
    end
  end
end
