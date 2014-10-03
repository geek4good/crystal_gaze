module CrystalGaze
  class EmailManifestation
    FirstNameDotLastName = Struct.new(:regex) do
      def match?(gestalt)
        regex =~ gestalt
      end

      def present(name, domain)
        firstname, lastname = name.downcase.split
        "#{firstname}.#{lastname}@#{domain}"
      end
    end

    FirstNameDotLastInitial = Struct.new(:regex) do
      def match?(gestalt)
        regex =~ gestalt
      end

      def present(name, domain)
        firstname, lastname = name.downcase.split
        "#{firstname}.#{lastname.chr}@#{domain}"
      end
    end

    FirstInitialDotLastName = Struct.new(:regex) do
      def match?(gestalt)
        regex =~ gestalt
      end

      def present(name, domain)
        firstname, lastname = name.downcase.split
        "#{firstname.chr}.#{lastname}@#{domain}"
      end
    end

    FirstInitialDotLastInitial = Struct.new(:regex) do
      def match?(gestalt)
        regex =~ gestalt
      end

      def present(name, domain)
        firstname, lastname = name.downcase.split
        "#{firstname.chr}.#{lastname.chr}@#{domain}"
      end
    end

    class << self
      def of(gestalt)
        manifestations.detect do |manifestation|
          manifestation.match?(gestalt)
        end
      end

      def manifestations
        @manifestations ||= [
          FirstInitialDotLastInitial.new(/\A\w\.\w\z/),
          FirstInitialDotLastName.new(/\A\w\.\w+\z/),
          FirstNameDotLastInitial.new(/\A\w+\.\w\z/),
          FirstNameDotLastName.new(/\A\w+\.\w+\z/)
        ]
      end
    end
  end
end
