require './lib/key'
require './lib/offset'

class Shift

  def initialize
    @keys = []
  end

  def characters(type, string, key, date, operator)
    @keys = generate_keys(key, date)
    output = Offset.new(@keys, string)
    output.method_name(operator)
    {type => output.message, key: key, date: date}
  end

  

  def generate_keys(key, date)
    a_key = Key.new((key[0..1]), date, 3)
    b_key = Key.new((key[1..2]), date, 2)
    c_key = Key.new((key[2..3]), date, 1)
    d_key = Key.new((key[3..4]), date, 0)
    [d_key, a_key, b_key, c_key]
  end
  
end