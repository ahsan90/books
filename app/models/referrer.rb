class Referrer < ActiveRecord::Base
    has_many :purchases
    attr_accessible :name, :email, :code
  # attr_accessible :title, :body
end
