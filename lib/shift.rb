require './lib/key'

class Shift

  def initialize
    @chars = ("a".."z").to_a << " "
    @keys = []
  end

  def characters(type, string, key, date, operator)
    @keys = generate_keys(key, date)
    output = ''
    string.each_char.with_index do |char, index|
      output << @chars.rotate(find_index(string, index, operator)).first
    end
    {type => output, key: key, date: date}
  end

  def find_index(string, index, operator)
    (@chars.index(string[index]).send(operator, (@keys.rotate!).first.value))
  end

  def generate_keys(key, date)
    a_key = Key.new((key[0..1]), date, 3)
    b_key = Key.new((key[1..2]), date, 2)
    c_key = Key.new((key[2..3]), date, 1)
    d_key = Key.new((key[3..4]), date, 0)
    [d_key, a_key, b_key, c_key]
  end
  
end