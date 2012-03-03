module MysqlSimpleFulltext
  def search_with_simple_fulltext fields
    @config = Config.new fields

    extend InstanceMethods
  end

  module InstanceMethods
    def fulltext_search query
      find_by_sql [ "SELECT *, MATCH (" + @config.fields.join(',') + ") AGAINST (?) AS fulltext_score FROM #{table_name} WHERE MATCH (" + @config.fields.join(',') + ") AGAINST (?) ORDER BY fulltext_score ASC", query, query ]
    end

    def fulltext_config
      @config
    end
  end

  class Config
    attr_accessor :fields

    def initialize(fields)
      self.fields= fields
    end
  end
end

ActiveRecord::Base.extend MysqlSimpleFulltext
