require "fileutils"

# Generate ./ellen/ directory from our templates.
module Ellen
  module Commands
    class Generate
      def call
        if valid?
          FileUtils.cp_r(templates_directory_path, destination_path)
        else
          puts "./ellen/ already exists."
        end
      end

      private

      def templates_directory_path
        File.expand_path("../../../../templates", __FILE__)
      end

      def destination_path
        "./ellen/"
      end

      def valid?
        !File.exists?(destination_path)
      end
    end
  end
end
