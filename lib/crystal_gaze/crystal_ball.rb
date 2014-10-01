module CrystalGaze
  class CrystalBall
    attr_reader :config

    def initialize(config = {})
      @config = config
    end

    def predict(asking)
      vision_type = asking.delete(:vision_of)

      case vision_type
      when /email/i then predict_email(asking)
      end
    end

    private

    def predict_email(asking)
      spirit_world.vision_of(:email, asking)
    end

    def spirit_world
      config[:spirit_world]
    end
  end
end

