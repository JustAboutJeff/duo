require 'spec_helper'

describe User do

  before(:each) do
    @count = User.all.count
  end

  it { should have_many(:teams) }
  it { should have_many(:people) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should_not allow_value("bogus").for(:email) }
  it { should allow_value("JohnDoe@gmail.com").for(:email) }
  it { should_not allow_value("short").for(:password) }
  it { should allow_value("properlength").for(:password) }
  # TODO: add error handling and raise exception
  context "with invalid input" do
    it "should not save user to database when one or more fields are empty" do
      expect{User.create(name: 'John')}.to raise_exception
      expect(User.all.count).to eq(@count)
    end
    # TODO: add error handling and raise exception
    it "should not create a user when email address is invalid format" do
     expect{ User.create(name: "John", email: "bogus@a.c", password: "password")}.to raise_exception
      User.all.count.should eq(@count)
    end

    it "should not create a user if name/email is already taken" do
      expect{FactoryGirl.create(:user)}.to_not raise_exception
      expect{FactoryGirl.create(:user)}.to raise_exception
    end
  end

  context "with valid input" do
    it "should create a user" do
      expect{FactoryGirl.create(:user)}.to_not raise_exception
      User.all.count.should eq(@count+1)
    end
    it "should validate uniqueness of email" do
      expect{FactoryGirl.create(:user)}.to_not raise_exception
      should validate_uniqueness_of :email
    end
  end
end