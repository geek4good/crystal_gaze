require "test_helper"

module CrystalGaze
  describe CrystalBall do
    subject { CrystalBall.new(config) }

    let(:config) do
      { :samples => { :emails => { "Steve Jobs" => "s.j@apple.com" } } }
    end

    it "exposes its configuration" do
      assert_equal(config, subject.config)
    end
  end
end
