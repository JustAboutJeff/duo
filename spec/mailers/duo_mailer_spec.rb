require "spec_helper"

describe DuoMailer do
  describe "duo_notify" do
    let(:user) { FactoryGirl.create(:user, email: "johndoe@example.com") }
    let(:partner) { FactoryGirl.create(:user, email: "partnerjohn@example.com") }
    let(:mail) { DuoMailer.duo_notify(user) }

    before :each do
      user.set_partner(partner)
    end

    it "renders the headers" do
      mail.subject.should eq("Your Weekly IFTTT Duo")
      mail.to.should eq(["johndoe@example.com"])
      mail.from.should eq(["duo@ifttt.com"])
    end

    it "renders the body" do
      mail.body.encoded.should include("Your weekly duo is here:")
    end
  end

end
