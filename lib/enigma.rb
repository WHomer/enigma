require './lib/key'
class Enigma

  def initialize
    @chars = ("a".."z").to_a << " "
  end

  def encrypt(string, key=generate_key, date=generate_date)
    keys = generate_keys(key, date)
    output = ''
    string.each_char.with_index do |char, index|
      output << @chars.rotate((@chars.index(string[index]) + (keys.rotate!).first.value)).first
    end
    {encryption: output, key: key, date: date}
  end

  def decrypt(string, key, date=generate_date)
    keys = generate_keys(key, date)
    output = ''
    string.each_char.with_index do |char, index|
      output << @chars.rotate((@chars.index(string[index]) - (keys.rotate!).first.value)).first
    end
    {decryption: output, key: key, date: date}
  end

  

  def generate_key
    rand.to_s[3..7]
  end

  def generate_date
    Time.now.strftime("%d%m%y")
  end
end