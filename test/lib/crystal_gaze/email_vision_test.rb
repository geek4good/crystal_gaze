require "test_helper"

module CrystalGaze
  describe EmailVision do
    subject { EmailVision.new(spirit_traces) }

    let(:spirit_traces) {
      {
        "Larry Page" => "larry.p@google.com",
        "Steve Jobs" => "s.j@apple.com"
      }
    }

    describe "#initialize" do
      it "save the spirit traces" do
        assert_equal(spirit_traces, subject.spirit_traces)
      end

      it "populates the vision with spirits" do
        assert_equal(spirit_traces.count, subject.spirits.count)
      end
    end

    describe "#experience" do
      it "reveals the protagonist's email address" do
        name = "Steve Wozniak"
        domain = "apple.com"
        assert_equal("s.w@apple.com", subject.experience(:name => name, :domain => domain))
      end
    end
  end
end
