class Invite < ActiveRecord::Base
  extend FriendlyId
  friendly_id :token

  attr_accessible :email

  validates :email, presence: true, email: true

  belongs_to :inviter, class_name: 'user'
  belongs_to :user_group

  before_save :generate_token

  private

  def generate_token
    self.token = SecureRandom.uuid if self.token.blank?
  end
end
