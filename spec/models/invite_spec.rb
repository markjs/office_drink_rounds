require 'spec_helper'

describe Invite do
  let(:invite) { create(:invite) }

  it { should respond_to :email }
  it { should validate_presence_of :email }
  it { should belong_to :user_group }

  describe "email address" do
    subject { invite }

    it "should allow valid email address" do
      build(:invite).should be_valid
    end

    it "should not allow invalid email address" do
      build(:invite, email: "invalid").should_not be_valid
    end
  end
end
