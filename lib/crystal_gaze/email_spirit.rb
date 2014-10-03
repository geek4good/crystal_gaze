module CrystalGaze
  class EmailSpirit
    attr_reader :name, :email, :local_part, :domain, :manifestation

    def initialize(name, email)
      @name = name
      @email = email
      @local_part, @domain = email.split("@")
    end

    def manifest
      manifest_as(name)
    end

    def manifest_as(name)
      manifestation && manifestation.present(name)
    end
  end
end
