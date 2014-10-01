require "test_helper"

module CrystalGaze
  describe SpiritWorld do
    subject { SpiritWorld }

    let(:denomination) { "denominator" }
    let(:vision) { "vision" }

    before { subject.exorcise }

    describe "initially" do
      it "is vast and void" do
        assert_empty(subject.visions)
      end

      it "is impossible to have a vision" do
        assert_raises(ImpenetrableMistError) { subject.vision_of(denomination) }
      end
    end

    describe ".exorcise" do
      it "rids the spirit world of its population" do
        subject.absorb_vision(denomination, vision)
        subject.exorcise

        assert_empty(subject.visions)
      end
    end

    describe ".absorb_vision" do

      before { assert_empty(subject.visions) }

      it "populates the spirit world" do
        subject.absorb_vision("vision", vision)
        refute_empty(subject.visions)
      end
    end

    describe ".vision_of" do
      let(:vision) { "A vision" }

      before { subject.absorb_vision(denomination, vision) }

      it "delivers the vision specified" do
        assert_equal(vision, subject.vision_of(denomination))
      end
    end
  end
end
