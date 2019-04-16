class Key
  attr_reader :value,
              :date_squared,
              :position,
              :key

  def initialize(key, date, position)
    @key = key
    @date_squared = date.to_i ** 2
    @position = position
    @value = create_key
  end

  def create_key
    require 'pry'; binding.pry
    @key.to_i + date_squared.digits[@position]
  end
end