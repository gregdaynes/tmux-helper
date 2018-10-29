#!/usr/bin/env ruby

require_relative 'tmux'
require_relative 'icon'
require_relative 'file_system'

working_directory = FileSystem::Directory.name
tmux = Tmux.new(working_directory)

# Process args passed in
args = []
ARGV.each do |arg|
  args.push arg.chomp
end

if !tmux.session.in_session?
  if tmux.session.exists?
    tmux.session.attach_session

    args.each do |name|
      tmux.tab.new_tab Icon.(name)
    end
  else
    tmux.session.create_session(Icon.(args.shift))

    args.each do |name|
      tmux.tab.new_tab Icon.(name)
    end

    tmux.session.attach_session
  end
else
  tmux.session.attach_session

  args.each do |name|
    tmux.tab.new_tab Icon.(name)
  end
end


