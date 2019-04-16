require 'minitest/autorun'
require './lib/enigma'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma_1 = Enigma.new()
    @key_a = Key.new("02", "040895", 3)
    @key_b = Key.new("27", "040895", 2)
    @key_c = Key.new("71", "040895", 1)
    @key_d = Key.new("15", "040895", 0)
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma_1
  end

  def test_you_can_generate_keys
    expected = [@key_d, @key_a, @key_b, @key_c]
    assert_equal 4, @enigma_1.generate_keys("02715", "040895").length
  end
  
  def test_it_can_generate_a_new_key
    assert_equal 5, @enigma_1.generate_key.length
  end

  def test_it_can_generate_a_new_date
    assert_equal 6, @enigma_1.generate_date.length
  end

  def test_the_enigma_can_encrypt
    result = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal result, @enigma_1.encrypt("hello world", "02715", "040895")
  end

  def test_the_enigma_can_encrypt_without_key_or_date
    assert_equal 11, @enigma_1.encrypt("hello world")[:encryption].length
  end

  def test_the_enigma_can_decrypt
    result = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal result, @enigma_1.decrypt("keder ohulw", "02715", "040895")
  end

  def test_the_enigma_can_decrypt_without_date
    assert_equal 11, @enigma_1.decrypt("keder ohulw", "02715")[:decryption].length
  end
end