module CrystalGaze
  class EmailSpirit
    attr_reader :name, :email, :local_part, :domain, :manifestation

    def initialize(name, email)
      @name = name
      @email = email
      @local_part, @domain = email.split("@")
      @manifestation = EmailManifestation.of(local_part)
    end

    def manifest
      manifest_as(name, domain)
    end

    def manifest_as(name, domain = domain)
      manifestation && manifestation.present(name, domain)
    end
  end
end
