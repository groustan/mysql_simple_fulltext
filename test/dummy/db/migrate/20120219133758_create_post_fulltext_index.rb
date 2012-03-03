class CreatePostFulltextIndex < ActiveRecord::Migration
  def self.up
    execute 'ALTER TABLE posts ENGINE = MyISAM'
    execute 'CREATE FULLTEXT INDEX fulltext_posts ON posts (title,content)'
  end

  def self.down
    execute 'ALTER TABLE posts ENGINE = InnoDB'
    execute 'DROP INDEX fulltext_posts ON posts'
  end
end
