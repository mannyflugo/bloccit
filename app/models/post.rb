class Post < ActiveRecord::Base
  has_may :comments
  attr_accessible :body, :title
end
