class NeverNil

  attr_accessor :data

  def initialize(data = nil)
    if data.is_a?(Hash)
      h = {}
      data.each do |(k, v)|
        h[k] =
          if v.is_a?(Hash)
            self.class.new(v)
          else
            v
          end
      data = h
      end
    end
    @data = OpenStruct.new(data)
  end

  def method_missing(method, *args)
    @data[method.to_s].nil? ? self.class.new : @data[method.to_s]
  end

  def [](key)
    @data[key]
  end

  def []=(key, value)
    @data[key] = value
  end

  def to_h
    @data.to_h
  end

  def to_json(options = nil)
    to_h.to_json
  end

  alias_method :as_json, :to_json

end
