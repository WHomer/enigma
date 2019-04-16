class Key
  attr_reader :value,
              :date_squared,
              :position,
              :key

  def initialize(key, date, position)
    @value = 12
    @key = key
    @date_squared = date.to_i ** 2
    @position = position
  end
end