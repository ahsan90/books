class Book < ActiveRecord::Base
  belongs_to :category
  # has_and_belongs_to_many :users
  has_many :purchases
  has_many :users, through: :purchases
  attr_accessible :title, :body, :atar, :price, :category_id, :display, :file, :preview
  mount_uploader :display, DisplayUploader
  mount_uploader :file, FileUploader
  mount_uploader :preview, FileUploader

  default_scope order('books.created_at ASC')

  validates :category, presence: true

  def price_in_cents
    self.price * 100
  end
  
end
