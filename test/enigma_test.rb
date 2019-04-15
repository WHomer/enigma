require 'minitest/autorun'
require './lib/enigma'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma_1 = Enigma.new()
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma_1
  end

  def test_you_can_generate_keys
    assert_equal [20,3,27,73], @enigma_1.generate_keys("02715", "040895")
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
end