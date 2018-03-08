module Ruboty
  class Robot
    DEFAULT_ENV = "development"
    DEFAULT_PORT = "8080"
    DEFAULT_ROBOT_NAME = "ruboty"

    include Mem

    delegate :say, to: :adapter

    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def run
      daemon
      dotenv
      bundle
      setup
      pid
      remember
      handle
      route
      adapt
    end

    def receive(attributes)
      message = Message.new(attributes.merge(robot: self))
      unless handlers.inject(false) { |matched, handler| matched | handler.call(message) }
        handlers.each do |handler|
          handler.call(message, missing: true)
        end
      end
    end

    # @return [true] Because it needs to tell that an action is matched.
    undef :say
    def say(*args)
      adapter.say(*args)
      true
    end

    # ROBOT_NAME is deprecated.
    def name
      ENV["RUBOTY_NAME"] || ENV["ROBOT_NAME"] || DEFAULT_ROBOT_NAME
    end

    def brain
      Brains::Base.find_class.new
    end
    memoize :brain

    def server
      WEBrick::HTTPServer.new({ Port: port, ServerType: Thread, Logger: Ruboty.logger })
    end
    memoize :server

    private

    def adapt
      adapter.run
    end

    def adapter
      AdapterBuilder.new(self).build
    end
    memoize :adapter

    def bundle
      ::Bundler.require(:default, env)
    rescue ::Bundler::GemfileNotFound
    end

    def env
      ENV["RUBOTY_ENV"] || DEFAULT_ENV
    end
    memoize :env

    def port
      ENV["PORT"] || ENV["RUBOTY_PORT"] || DEFAULT_PORT
    end
    memoize :port

    def daemon
      Process.daemon(true, false) if options[:daemon]
    end

    def dotenv
      Dotenv.load if options[:dotenv]
    end

    def setup
      load(options[:load]) if options[:load]
    end

    def handlers
      Ruboty.handlers.map { |handler_class| handler_class.new(self) }
    end
    memoize :handlers

    def routers
      Ruboty.routers.map { |router_class| router_class.new(self) }
    end
    memoize :routers

    def remember
      brain
    end

    def handle
      handlers
    end

    def route
      routers
      server.start
    end

    def pid
      path = options[:pid]
      if path
        File.open(path, "w") { |f| f.write(Process.pid) }
        at_exit { File.unlink(path) }
      end
    end
  end
end
