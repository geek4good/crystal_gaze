module CrystalGaze
  class CloudedVisionError < StandardError; end

  class EmailVision
    attr_reader :spirits, :spirit_traces

    def initialize(spirit_traces)
      @spirit_traces = spirit_traces
      @spirits = spirit_traces.map { |name, email| EmailSpirit.new(name, email) }
    end

    def experience(protagonist)
      manifestations = spirits_of(protagonist[:domain]).map { |spirit|
        spirit.manifest_as(protagonist[:name])
      }.uniq

      fail CloudedVisionError unless manifestations.count == 1

      manifestations.first
    end

    private

    def spirits_of(domain)
      spirits.select { |spirit| spirit.domain == domain }
    end
  end
end
