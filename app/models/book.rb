class Book < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :users
  attr_accessible :title, :body, :atar, :price, :category_id, :display, :file, :preview
  mount_uploader :display, DisplayUploader
  mount_uploader :file, FileUploader
  mount_uploader :preview, FileUploader

  default_scope order('created_at DESC')

  validates :category, presence: true

  def price_in_cents
    self.price * 100
  end

  after_save :send_book_emails

  private

  def send_book_emails
    self.book.each do |book|
      BookMailer.book_purchase(self.book, self).deliver
    end
  end
  
end
