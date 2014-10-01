require "test_helper"

module CrystalGaze
  describe CrystalBall do
    subject { CrystalBall.new(config) }

    let(:config) do
      {
        :spirit_world => spirit_world,
        :spirits => { :emails => { "Steve Jobs" => "s.j@apple.com" } }
      }
    end

    let(:spirit_world) { MiniTest::Mock.new }

    describe "#config" do
      it "exposes its configuration" do
        assert_equal(config, subject.config)
      end
    end

    describe "#predict" do
      let(:asking) { { :vision_of => "email", :name => name, :domain => domain } }
      let(:name) { "Steve Wozniak" }
      let(:domain) { "apple.com" }

      it "enters the spirit world for a vision" do
        spirit_world.expect(:vision_of, nil, [:email, :name => name, :domain => domain])
        subject.predict(asking)

        assert spirit_world.verify
      end
    end
  end
end
