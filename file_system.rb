# FileSystem Helpers
class FileSystem
  # Directory helpers
  module Directory
    def self.name
      File.basename(Dir.getwd)
    end
  end
end
