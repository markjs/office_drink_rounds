class Invite < ActiveRecord::Base
  attr_accessible :email

  belongs_to :inviter, class_name: 'user'
  belongs_to :user_group
end
