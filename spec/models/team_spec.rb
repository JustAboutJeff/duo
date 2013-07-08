require 'spec_helper'

describe Team do

  before(:each) do
    @count = Team.all.count
  end

  it { should have_many(:users) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  context "with invalid input" do
    it "should not save team to database without a name" do
      Team.create()
      expect(Team.all.count).to eq(@count)
    end

    it "should not create a user if name/email is already taken" do
      expect{FactoryGirl.create(:team, name: "example")}.to_not raise_exception
      expect{FactoryGirl.create(:team, name: "example")}.to raise_exception
    end
  end

  context "with valid input" do
    it "should create a team" do
      expect{FactoryGirl.create(:team)}.to_not raise_exception
      Team.all.count.should eq(@count+1)
    end
  end
end