require 'spec_helper'

describe UserGroup do
  it { should respond_to :name }
  it { should validate_presence_of :name }
  it { should have_many :users }
  it { should have_many :invites }
end
