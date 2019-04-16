class Offset
  attr_reader :message
  
  def initialize(keys, string)
    @chars = ("a".."z").to_a << " "
    @keys = keys
    @string = string
    @message = ''
  end

  def method_name(operator)
    @string.each_char.with_index do |char, index|
      if @chars.include?(@string[index])
        @message << @chars.rotate(find_index(index, operator)).first
      else
        @message << @string[index]
      end
    end
  end

  def find_index(index, operator)
    (@chars.index(@string[index]).send(operator, (@keys.rotate!).first.value))
  end

end