require "test_helper"

module CrystalGaze
  describe EmailManifestation do
    describe ".of" do
      it "instanciates a matching manifestation for 's.j'" do
        assert_equal("s.j@apple.com", EmailManifestation.of("s.j").present("Steve Jobs", "apple.com"))
      end

      it "instanciates a matching manifestation for 'steve.j'" do
        assert_equal("steve.j@apple.com", EmailManifestation.of("steve.j").present("Steve Jobs", "apple.com"))
      end

      it "instanciates a matching manifestation for 's.jobs'" do
        assert_equal("s.jobs@apple.com", EmailManifestation.of("s.jobs").present("Steve Jobs", "apple.com"))
      end

      it "instanciates a matching manifestation for 'steve.jobs'" do
        assert_equal("steve.jobs@apple.com", EmailManifestation.of("steve.jobs").present("Steve Jobs", "apple.com"))
      end
    end
  end
end
