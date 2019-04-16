require './test/test_helper'

class OffsetTest < MiniTest::Test
  def setup
    @offset = Offset.new(['key1', 'key2'], 'hello world')
  end

  def test_does_it_exist
    assert_instance_of Offset, @offset
  end
  
  def test_does_it_have_an_message
    assert_equal '', @offset.message
  end
end