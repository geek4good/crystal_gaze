require "test_helper"

module CrystalGaze
  describe EmailManifestation do
    describe ".of" do
      it "instanciates a matching manifestation for 's.j'" do
        assert_instance_of(EmailManifestation::FirstInitialDotLastInitial, EmailManifestation.of("s.j"))
      end
      it "instanciates a matching manifestation for 'steve.j'" do
        assert_instance_of(EmailManifestation::FirstNameDotLastInitial, EmailManifestation.of("steve.j"))
      end
      it "instanciates a matching manifestation for 's.jobs'" do
        assert_instance_of(EmailManifestation::FirstInitialDotLastName, EmailManifestation.of("s.jobs"))
      end
      it "instanciates a matching manifestation for 'steve.jobs'" do
        assert_instance_of(EmailManifestation::FirstNameDotLastName, EmailManifestation.of("steve.jobs"))
      end
    end
  end
end
