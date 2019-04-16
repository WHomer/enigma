require './lib/shift'
class Enigma

  def initialize
    @shift = Shift.new
  end

  def encrypt(string, key=generate_key, date=generate_date)
    @shift.characters(:encryption, string, key, date)
  end

  def decrypt(string, key, date=generate_date)
    @shift.characters(:decryption, string, key, date)
  end

  def generate_key
    rand.to_s[3..7]
  end

  def generate_date
    Time.now.strftime("%d%m%y")
  end
end