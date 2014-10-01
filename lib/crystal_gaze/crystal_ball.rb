module CrystalGaze
  class CrystalBall
    attr_reader :config

    def initialize(config = {})
      @config = config
    end

    def predict(asking)
      vision_type = asking.delete(:vision_of)
      vision = spirit_world.vision_of(vision_type)

      vision.experience(asking)
    end

    private

    def spirit_world
      config[:spirit_world]
    end
  end
end

