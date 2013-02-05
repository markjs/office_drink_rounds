require 'spec_helper'

describe User do
  let(:user) { create(:user) }

  it { should respond_to :email }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password_digest }

  describe "email address" do
    subject { user }

    it "should allow valid email address" do
      build(:user).should be_valid
    end

    it "should not allow invalid email address" do
      build(:user, email: "invalid").should_not be_valid
    end
  end
end
