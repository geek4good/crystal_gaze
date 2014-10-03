require "test_helper"

module CrystalGaze
  describe EmailManifestation do
    describe ".of" do
      it "instanciates a manifestation of a matching gestalt" do
        assert_instance_of(EmailManifestation::FirstInitialDotLastInitial, EmailManifestation.of("s.j"))
      end
    end
  end
end
