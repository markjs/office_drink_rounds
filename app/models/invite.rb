class Invite < ActiveRecord::Base
  attr_accessible :email

  belongs_to :inviter, class: User
  belongs_to :user_group
end
