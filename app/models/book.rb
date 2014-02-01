class Book < ActiveRecord::Base
  belongs_to :category
  attr_accessible :title, :body, :atar, :price
end
