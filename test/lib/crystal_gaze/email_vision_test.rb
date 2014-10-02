require "test_helper"

module CrystalGaze
  describe EmailVision do
    subject { EmailVision.new(spirit_traces) }

    let(:spirit_traces) { { "Steve Jobs" => "s.j@apple.com" } }

    describe "#experience" do
      it "reveals the protagonist's email address" do
        name = "Steve Wozniak"
        domain = "apple.com"
        assert_equal("s.w@apple.com", subject.experience(:name => name, :domain => domain))
      end
    end
  end
end
