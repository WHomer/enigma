require './test/test_helper'

class KeysTest < MiniTest::Test
  def setup
    @key = Key.new("02715", "040895", 3)
  end

  def test_does_it_exist
    assert_instance_of Key, @key
  end

  def test_it_has_instance_variables
    assert_equal 2716, @key.value
    assert_equal 1672401025, @key.date_squared
    assert_equal 3, @key.position
    assert_equal "02715", @key.key
  end

  def test_can_it_create_a_key
    assert_equal 2716, @key.create_key
  end

end