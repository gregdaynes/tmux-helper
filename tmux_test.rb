require 'minitest/autorun'
require_relative 'tmux'

class TmuxCommandsTest < Minitest::Test
  def test_has_session
    assert_equal Tmux::Commands.has_session('test'), 'tmux has-session -t test'
  end

  def test_display_message
    assert_equal Tmux::Commands.display_message,
      'tmux display-message -p #S'
    assert_equal Tmux::Commands.display_message('#S'),
      'tmux display-message -p #S'
  end

  def test_new_window
    assert_equal Tmux::Commands.new_window('Test', 'test'),
      'tmux new-window -n Test -t test'
  end
end

