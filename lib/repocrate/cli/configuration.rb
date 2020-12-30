require 'toml'

class Configuration
  
  attr_reader :content

  def initialize(path)
    @path = path
    @content = nil
  end

  def valid_path?
    File.file?(@path)
  end

  def load
    if @content.nil?
      @content = TOML.load_file(@path)
    end
    @content
  end
end
