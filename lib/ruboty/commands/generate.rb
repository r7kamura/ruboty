require "fileutils"

module Ruboty
  module Commands
    class Generate < Base
      def call
        valid? ? copy : die
      end

      private

      def copy
        FileUtils.cp_r(templates_directory_path, destination_path)
      end

      def die
        Ruboty.die("#{destination_path} already exists.")
      end

      def templates_directory_path
        File.expand_path("../../../../templates", __FILE__)
      end

      def destination_path
        "./ruboty/"
      end

      def valid?
        !File.exist?(destination_path)
      end
    end
  end
end
