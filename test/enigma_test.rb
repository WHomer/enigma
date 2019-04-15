require 'minitest/autorun'
require './lib/enigma'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma_1 = Enigma.new()
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma_1
  end

  def test_the_enigma_can_encrypt
    result = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal result, @enigma_1.encrypt("hello world", "02715", "040895")
  end

end