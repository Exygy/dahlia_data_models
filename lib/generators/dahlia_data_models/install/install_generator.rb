require 'rails/generators'
require 'rails/generators/migration'

module DahliaDataModels
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc 'Add the migrations for DahliaDataModels'

      def self.next_migration_number(path)
        next_migration_number = current_migration_number(path) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      def copy_migrations
        Dir.glob('migrations/*.rb').each do |filename|
          migration_template "migrations/#{filename}",
            "db/migrate/#{filename}", migration_version: migration_version
        end
      end

      def copy_seed_files
        copy_file "seeds.rb", "db/seeds.rb"
        Dir.glob('seed_data/*.json').each do |filename|
          copy_file "seed_data/#{filename}", "db/seed_data/#{filename}"
        end
      end

      private

      def migration_version
        if Rails::VERSION::MAJOR >= 5
          "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
        end
      end
    end
  end
end
