class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  belongs_to :referrer

  attr_accessible :user, :book, :referrer

end