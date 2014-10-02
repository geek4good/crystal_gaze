require "crystal_gaze/version"
require "crystal_gaze/crystal_ball"
require "crystal_gaze/spirit_world"

module CrystalGaze
  def self.set_the_mood
    @crystal_ball ||= CrystalBall.new(:spirit_world => CrystalGaze::SpiritWorld)
  end

  def self.consult_crystal_ball(asking)
    set_the_mood

    type, name, domain = asking
    @crystal_ball.predict(:vision_of => type, :name => name, :domain => domain)
  end
end
