class Referrer < ActiveRecord::Base
    has_many :purchases
    attr_accessible :name, :email
  # attr_accessible :title, :body
end
