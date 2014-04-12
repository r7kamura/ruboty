require "fileutils"

# Generate ./ellen/ directory from our templates.
module Ellen
  module Commands
    class Generate
      def call
        FileUtils.cp_r(templates_directory_path, "./ellen")
      end

      private

      def templates_directory_path
        File.expand_path("../../../../templates", __FILE__)
      end
    end
  end
end
