module Ruboty
  module Paths
    class Help < Base
      def call
        response.body = all_descriptions.join("\n")
      end

      private

      def all_descriptions
        _descriptions = Ruboty.paths.sort.map do |path|
          "#{path.directory} - #{path.description}"
        end
      end
    end
  end
end
