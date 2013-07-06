require 'spec_helper'
require 'duo_calculator'

describe DuoCalculator do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @calculator = DuoCalculator.new(@user)
    @team = FactoryGirl.create(:team)
    @team.users << @user
  end

  context "get team members" do
    it "should return the team members" do
      @user2 = FactoryGirl.create(:user)
      @user3 = FactoryGirl.create(:user)
      @team.users << @user2
      @team.users << @user3
      expect(@calculator.get_team_members.sort).to eq([@user2,@user3])
    end

    it "should parallel partner ids" do
      @user2 = FactoryGirl.create(:user)
      @user.set_partner(@user2)
      expect(@user.partner).to eq(@user2)
      expect(@user2.partner).to eq(@user)
    end
  end
end