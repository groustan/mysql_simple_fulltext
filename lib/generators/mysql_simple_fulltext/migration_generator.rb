require 'rails/generators/migration'

module MysqlSimpleFulltext
  class MigrationGenerator < Rails::Generators::NamedBase
    include Rails::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    def create_migration_file
      migration_template "migration.rb", "db/migrate/create_#{file_name}_fulltext_index.rb"
    end

    def fulltext_fields
      eval(name).fulltext_config.fields
    end

    # Define the next_migration_number method (necessary for the migration_template method to work)
    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        sleep 1 # make sure each time we get a different timestamp
        Time.new.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end
  end
end
