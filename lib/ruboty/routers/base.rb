module Ruboty
  module Routers
    class Base
      class << self
        include Mem

        def inherited(child)
          Ruboty.routers << child
        end

        def on(directory, options = {})
          paths << Path.new(directory, options)
        end

        def paths
          []
        end
        memoize :paths
      end

      include Env::Validatable

      attr_reader :robot

      def initialize(robot)
        @robot = robot
        validate!

        self.class.paths.each do |path|
          @robot.server.mount_proc(path.directory, method(path.name))
        end
      end
    end
  end
end
