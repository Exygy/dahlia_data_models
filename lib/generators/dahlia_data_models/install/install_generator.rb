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
        migration_template 'create_dahlia_listings.rb',
          'db/migrate/create_dahlia_listings.rb', migration_version: migration_version
        migration_template 'create_dahlia_groups.rb',
          'db/migrate/create_dahlia_groups.rb', migration_version: migration_version
        migration_template 'create_dahlia_units.rb',
          'db/migrate/create_dahlia_units.rb', migration_version: migration_version
        migration_template 'add_unit_related_fields_to_listing.rb',
          'db/migrate/add_unit_related_fields_to_listing.rb', migration_version: migration_version
        migration_template 'add_gtm_key_to_groups.rb',
          'db/migrate/add_gtm_key_to_groups.rb', migration_version: migration_version
        migration_template 'create_dahlia_ami_charts.rb',
          'db/migrate/create_dahlia_ami_charts.rb', migration_version: migration_version
        migration_template 'add_monthly_rent_percentage_to_units.rb',
          'db/migrate/add_monthly_rent_percentage_to_units.rb', migration_version: migration_version
        migration_template 'create_dahlia_preferences.rb',
          'db/migrate/create_dahlia_preferences.rb', migration_version: migration_version
        migration_template 'add_application_download_to_listings.rb',
          'db/migrate/add_application_download_to_listings.rb', migration_version: migration_version
        migration_template 'update_listings_fields.rb',
          'db/migrate/update_listings_fields.rb', migration_version: migration_version
        migration_template 'update_units_income_fields.rb',
          'db/migrate/update_units_income_fields.rb', migration_version: migration_version
      end

      def copy_seed_files
        copy_file "seeds.rb", "db/seeds.rb"
        copy_file "seed_data/groups.json", "db/seed_data/groups.json"
        copy_file "seed_data/sj_listing.json", "db/seed_data/sj_listing.json"
        copy_file "seed_data/smc_listing.json", "db/seed_data/smc_listing.json"
        copy_file "seed_data/test_listing.json", "db/seed_data/test_listing.json"
        copy_file "seed_data/unit.json", "db/seed_data/unit.json"
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
