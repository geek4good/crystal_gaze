require "test_helper"

module CrystalGaze
  describe SpiritWorld do
    subject { SpiritWorld }

    let(:vision_type) { "email" }

    describe "initially" do
      it "is vast and void" do
        assert_empty(subject.visions)
      end

      it "is impossible to have a vision" do
        assert_raises(ImpenetrableMistError) { subject.vision_of(vision_type) }
      end
    end
  end
end
