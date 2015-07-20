module Abstractive
  class << self
    def [](actor)
      if Celluloid[actor]
        Celluloid[actor]
      else
        const_get(actor.to_s.capitalize)
      end
    end
    
    def shash(data)
      return unless data.is_a? Hash
      data.reduce({}) { |cleaned, (k, v)| cleaned.tap { |m| m[k.to_sym] = v } }
    end

    def recursive_merge(a, b)
      a.merge(b) {|key, a_item, b_item| recursive_merge(a_item, b_item) }
    end
  end
end
