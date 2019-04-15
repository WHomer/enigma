class Enigma

  def encrypt(string, key=generate_key, date=generate_date)
    chars = ("a".."z").to_a << " "
    keys = generate_keys(key, date)
    output = ''
    string.each_char.with_index do |char, index|
      output << chars.rotate((chars.index(string[index]) + (keys.rotate!).first)).first
    end
    {encryption: output, key: key, date: date}
  end

  def decrypt(string, key, date=generate_date)
    chars = ("a".."z").to_a << " "
    keys = generate_keys(key, date)
    output = ''
    string.each_char.with_index do |char, index|
      output << chars.rotate((chars.index(string[index]) - (keys.rotate!).first)).first
    end
    {decryption: output, key: key, date: date}
  end

  def generate_keys(key, date)
    date_squared = date.to_i ** 2
    a_key = key[0..1].to_i + date_squared.digits[3]
    b_key = key[1..2].to_i + date_squared.digits[2]
    c_key = key[2..3].to_i + date_squared.digits[1]
    d_key = key[3..4].to_i + date_squared.digits[0]
    [d_key, a_key, b_key, c_key]
  end

  def generate_key
    rand.to_s[3..7]
  end

  def generate_date
    Time.now.strftime("%d%m%y")
  end



  # 1. Create a random 5 digit number
  # 1a. take 1-2, 2-3, 3-4, 4-5 and 
  # 1b. set them to a,b,c,d these are the keys
  # 2. offset by date DDMMYY
  # 2a. square root number
  # 2b. take the last four numbers.
  # 2c. take each digit and add them to key.
end