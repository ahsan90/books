class Book < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :users
  attr_accessible :title, :body, :atar, :price, :category_id, :display
  mount_uploader :display, DisplayUploader

  default_scope order('created_at DESC')

  def price_in_cents
    self.price * 100
  end
  
end
