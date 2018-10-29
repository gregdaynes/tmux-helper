require 'minitest/autorun'
require_relative 'file_system'

class FileSystem::DirectoryTest < Minitest::Test
  def test_name
    assert_equal FileSystem::Directory.name, 'tmux'
  end
end
