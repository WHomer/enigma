require 'minitest/autorun'
require './lib/shift'

class ShiftTest < MiniTest::Test
  def setup
    @shift = Shift.new
  end

  def test_does_it_exist
    assert_instance_of Shift, @shift
  end
  

end