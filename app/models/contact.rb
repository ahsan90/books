class Contact
  # attr_accessible :title, :body
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :subject, :body, :studentname, :guardianname, :address, :suburb, :phone, :emergencyphone, :schoolgrade, :foods, :medical, :dob, :gender, :workshop

  validates :email, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end
