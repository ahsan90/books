class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :books
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  ROLES = %w[moderator admin]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end  

end
