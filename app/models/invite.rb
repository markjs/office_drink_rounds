class Invite < ActiveRecord::Base
  attr_accessible :email

  validates :email, presence: true, email: true

  belongs_to :inviter, class_name: 'user'
  belongs_to :user_group
end
