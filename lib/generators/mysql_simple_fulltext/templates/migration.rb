class <%= migration_class_name %> < ActiveRecord::Migration
  def self.up
    execute 'ALTER TABLE <%= plural_name %> ENGINE = MyISAM'
    execute 'CREATE FULLTEXT INDEX fulltext_<%= plural_name %> ON <%= plural_name %> (<%= fulltext_fields.join(',') %>)'
  end

  def self.down
    execute 'ALTER TABLE <%= plural_name %> ENGINE = InnoDB'
    execute 'DROP INDEX fulltext_<%= plural_name %> ON <%= plural_name %>'
  end
end
