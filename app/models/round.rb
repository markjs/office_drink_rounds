class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_group

  attr_accessible :user, :user_id
end
