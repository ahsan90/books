class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  attr_accessible :book, :user, :referrer
end