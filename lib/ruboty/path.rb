module Ruboty
  class Path
    attr_reader :options, :directory

    def initialize(directory, options = {})
      @directory = directory
      @options = options
    end

    def description
      options[:description] || "(no description)"
    end

    def name
      options[:name]
    end

    def <=>(path)
      directory <=> path.directory
    end
  end
end
