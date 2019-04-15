class Enigma

  def encrypt(string, key, date)
    chars = ("a".."z").to_a << " "
    a_key = key[0..1].to_i
    b_key = key[1..2].to_i
    c_key = key[2..3].to_i
    d_key = key[3..4].to_i
    date_squared = date.to_i ** 2
    a_key += date_squared.digits[3]
    b_key += date_squared.digits[2]
    c_key += date_squared.digits[1]
    d_key += date_squared.digits[0]
    a_key = a_key % chars.length
    b_key = b_key % chars.length
    c_key = c_key % chars.length
    d_key = d_key % chars.length
    keys = [d_key, a_key, b_key, c_key]
    output = ''
    string.each_char.with_index do |char, index|
      # require 'pry'; binding.pry
      output << chars.rotate((chars.index(string[index]) + (keys.rotate!).first)).first
    end
    require 'pry'; binding.pry


  end



  # 1. Create a random 5 digit number
  # 1a. take 1-2, 2-3, 3-4, 4-5 and 
  # 1b. set them to a,b,c,d these are the keys
  # 2. offset by date DDMMYY
  # 2a. square root number
  # 2b. take the last four numbers.
  # 2c. take each digit and add them to key.
end