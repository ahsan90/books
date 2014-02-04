class Book < ActiveRecord::Base
  belongs_to :category
  attr_accessible :title, :body, :atar, :price, :category_id

  default_scope order('created_at DESC')
end
