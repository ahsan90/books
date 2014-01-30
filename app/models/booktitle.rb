class Booktitle < ActiveRecord::Base
  belongs_to :category
  # attr_accessible :title, :body
end
