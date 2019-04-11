require 'minitest/autorun'
require './lib/enigma'

class EnigmaTest < MiniTest::Test
  def setup
    @enigma_1 = Enigma.new()
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma_1
  end

end