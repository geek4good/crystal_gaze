require "crystal_gaze/version"
require "crystal_gaze/crystal_ball"
require "crystal_gaze/spirit_world"
require "crystal_gaze/email_vision"
require "crystal_gaze/email_spirit"

module CrystalGaze
  def self.consult_crystal_ball(asking)
    set_the_mood

    type, name, domain = asking
    @crystal_ball.predict(:vision_of => type, :name => name, :domain => domain)
  end

  def self.set_the_mood
    @crystal_ball ||= begin
      spirit_traces = {
        "John Ferguson" => "john.ferguson@alphasights.com",
        "Damon Aw" => "damon.aw@alphasights.com",
        "Linda Li" => "linda.li@alphasights.com",
        "Larry Page" => "larry.p@google.com",
        "Sergey Brin" => "s.brin@google.com",
        "Steve Jobs" => "s.j@apple.com"
      }
      vision = EmailVision.new(spirit_traces)
      SpiritWorld.absorb_vision("email", vision)

      CrystalBall.new(:spirit_world => SpiritWorld)
    end
  end
end
