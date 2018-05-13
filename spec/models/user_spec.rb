require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.create!(name: "Gabe", email: "abc@abc.com", password: "abcdef")
  end

  describe "creation" do 
    it "should have one item created after being created" do
      expect(User.all.count).to eq(1)
    end
  end

  describe "validations" do
    it "should not let the user be created without an email address" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "should not let a user be created without a password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end
  end

  describe "length validations" do
    it "shpuld not allow a name bigger than 50 characters" do
      @user.name = "g" * 51
      expect(@user).to_not be_valid
    end 
  end
end