class Book < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :users
  attr_accessible :title, :body, :atar, :price, :category_id, :display, :file, :preview
  mount_uploader :display, DisplayUploader
  mount_uploader :file, FileUploader
  mount_uploader :preview, FileUploader

  default_scope order('created_at DESC')

  validates :category, presence: true
end
