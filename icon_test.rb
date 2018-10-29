require 'minitest/autorun'
require_relative 'icon'

class TmuxTest < Minitest::Test
  def test_call
    assert_equal Icon.call(:vim), ''
  end
end
