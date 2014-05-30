class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged 
  attr_accessible :body, :title
  has_many :books
  #def dropdown
  # Category.All

    #category.find_or_create_by(Category.All)
  #end
end