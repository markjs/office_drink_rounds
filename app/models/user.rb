class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation 

  validates :email, presence: true, uniqueness: true, email: true

  belongs_to :user_group
end
