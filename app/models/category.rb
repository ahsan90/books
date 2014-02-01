class Category < ActiveRecord::Base
  attr_accessible :body, :title
  has_many :books
end
