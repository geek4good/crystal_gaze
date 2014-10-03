module CrystalGaze
  class EmailManifestation
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
        @manifestations ||= [FirstInitialDotLastInitial.new(/\A\w\.\w\z/)]
      end
    end
  end
end
