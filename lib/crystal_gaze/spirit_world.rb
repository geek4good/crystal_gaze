module CrystalGaze
  class ImpenetrableMistError < KeyError; end

  class SpiritWorld
    class << self
      def visions
        @visions ||= {}
      end

      def exorcise
        visions.clear
      end

      def absorb_vision(denomination, vision)
        visions[denomination.downcase.to_sym] = vision
      end

      def vision_of(denomination)
        visions.fetch(denomination.downcase.to_sym)
      rescue KeyError => e
        raise ImpenetrableMistError, e.message
      end
    end
  end
end
