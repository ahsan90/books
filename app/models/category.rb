class Category < ActiveRecord::Base
  attr_accessible :body, :title
  has_many :books
  #def dropdown
  # Category.All

    #category.find_or_create_by(Category.All)
  #end
end
