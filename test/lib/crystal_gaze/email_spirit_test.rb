require "test_helper"

module CrystalGaze
  describe EmailSpirit do
    subject { EmailSpirit.new(name, email) }

    let(:name) { "Steve Wozniak" }
    let(:email) { "s.w@apple.com" }

    describe "#initialize" do
      it "assigns the name" do
        assert_equal(name, subject.name)
      end

      it "assigns the email" do
        assert_equal(email, subject.email)
      end

      it "detects and assigns the local part" do
        assert_equal("s.w", subject.local_part)
      end

      it "detects and assigns the domain" do
        assert_equal("apple.com", subject.domain)
      end
    end

    describe "#manifest" do
      it "presents itself" do
        assert_equal(email, subject.manifest)
      end

      describe "without a manifestation" do
        it "doesn't present itself" do
          subject.stub(:manifestation, nil) do
            assert_nil(subject.manifest)
          end
        end
      end
    end

    describe "#manifest_as" do
      it "can manifest as somebody else" do
        assert_equal("s.b@apple.com", subject.manifest_as("Steve Ballmer"))
      end

      describe "without a manifestation" do
        it "doesn't present" do
          subject.stub(:manifestation, nil) do
            assert_nil(subject.manifest_as("Steve Ballmer"))
          end
        end
      end
    end
  end
end
