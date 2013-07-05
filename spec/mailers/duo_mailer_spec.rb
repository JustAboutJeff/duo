require "spec_helper"

describe DuoMailer do
  describe "duo_notify" do
    let(:mail) { DuoMailer.duo_notify }

    it "renders the headers" do
      mail.subject.should eq("Duo notify")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
