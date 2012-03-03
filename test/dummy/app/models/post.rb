class Post < ActiveRecord::Base
  search_with_simple_fulltext [:title, :content]

  attr_accessible :title, :content
end
