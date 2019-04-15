require 'minitest/autorun'
require './lib/key'

class KeysTest < MiniTest::Test
  def setup
    @key = Key.new
  end

  def test_does_it_exist
    assert_instance_of Key, @key
  end

  def test_it_has_a_position
    assert_equal 12, @key.value
  end
  

end