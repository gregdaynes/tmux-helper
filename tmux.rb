class Tmux
  attr_reader :session_name, :session, :tab, :commands

  def initialize(session_name)
    @session_name = session_name
    @session = Session.new(session_name, self)
    @tab = Tab.new(session_name, self)
    @commands = Commands.new(session_name, self)
  end

  class Session
    attr_reader :session_name, :tmux

    def initialize(session_name, tmux)
      @session_name = session_name
      @tmux = tmux
    end

    def exists?
      system "#{@tmux.commands.has_session}"
    end

    def in_session?
      system "#{@tmux.commands.current_session}"
    end

    def attach_session
      system "#{@tmux.commands.attach_session}"
    end

    def create_session(name = 'tab')
      system "#{@tmux.commands.create_session} -n #{name}"
    end
  end

  class Tab
    attr_reader :session_name, :tmux

    def initialize(session_name, tmux)
      @session_name = session_name
      @tmux = tmux
    end

    def new_tab(name)
      system "#{tmux.commands.new_window(name)}"
    end
  end

  class Commands
    attr_reader :session_name, :tmux

    def initialize(session_name, tmux)
      @session_name = session_name
      @tmux = tmux
    end

    def has_session
      "tmux has-session -t #{session_name}"
    end

    def current_session
      "tmux display-message -p '#S'"
    end

    def new_window(name)
      "tmux new-window -n #{name} -t #{session_name}"
    end

    def attach_session
      "tmux attach-session -t #{session_name}"
    end

    def create_session
      "tmux new -s #{session_name} -d"
    end
  end
end
