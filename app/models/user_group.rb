class UserGroup < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name

  has_many :users
  has_many :invites
  has_many :rounds
end
