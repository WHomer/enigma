require './test/test_helper'

class ShiftTest < MiniTest::Test
  def setup
    @shift = Shift.new
  end

  def test_does_it_exist
    assert_instance_of Shift, @shift
  end

  def test_it_will_return_correct_keys
    assert_equal :decryption, @shift.characters(:decryption, 'hello', '02715', '040895', '-').keys[0]
    assert_equal :encryption, @shift.characters(:encryption, 'hello', '02715', '040895', '+').keys[0]
  end

  def test_you_can_generate_keys
    assert_equal 4, @shift.generate_keys("02715", "040895").length
  end
  

end