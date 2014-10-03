module CrystalGaze
  class EmailManifestation
    class << self
      def of(gestalt)
        manifestations.detect do |manifestation|
          manifestation.match?(gestalt)
        end
      end

      def manifestations
        @manifestations ||=
          {
          "FirstInitialDotLastInitial" => {
            :match? => -> (gestalt) {
              !!/\A\w\.\w\z/.match(gestalt)
            },
            :present => -> (name, domain) {
              first_name, last_name = name.downcase.split
              "#{first_name.chr}.#{last_name.chr}@#{domain}"
            }
          },
          "FirstInitialDotLastName" => {
            :match? => -> (gestalt) {
              !!/\A\w\.\w+\z/.match(gestalt)
            },
            :present=> -> (name, domain) {
              first_name, last_name = name.downcase.split
              "#{first_name.chr}.#{last_name}@#{domain}"
            }
          },
          "FirstNameDotLastInitial" => {
            :match? => -> (gestalt) {
              !!/\A\w+\.\w\z/.match(gestalt)
            },
            :present => -> (name, domain) {
              first_name, last_name = name.downcase.split
              "#{first_name}.#{last_name.chr}@#{domain}"
            }
          },
          "FirstNameDotLastName" => {
            :match? => -> (gestalt) {
              !!/\A\w+\.\w+\z/.match(gestalt)
            },
            :present => -> (name, domain) {
              first_name, last_name = name.downcase.split
              "#{first_name}.#{last_name}@#{domain}"
            }
          }
        }.map do |type_name, methods|
          const_set(type_name, Class.new {
            methods.each do |method_name, implementation|
              define_method(method_name, implementation)
            end
          })

          const_get(type_name).new
        end
      end
    end
  end
end
