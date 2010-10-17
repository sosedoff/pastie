module Pastie
  class History
    attr_reader :path
    attr_accessor :links
    
    def initialize
      @path = "#{RUBY_PLATFORM =~ /mswin32|mingw32/ ? ENV['USERPROFILE'] : ENV['HOME']}/.pastie"
      @links = []
      self.load
    end
    
    # Load history
    def load
      if File.exists?(@path) && File.readable?(@path)
        File.open(@path).readlines("\r\n").each do |l|
          @links << l.strip
        end
      else
        if File.writable?(File.dirname(@path))
          File.open(@path, 'w').close
        end
      end
    end
    
    # Add new paste to the history
    def add(url)
      @links << url
    end
    
    # Flush history
    def flush
      @links = []
    end
    
    # Save history
    def save
      File.open(@path, 'w') { |f| f.write(@links.join("\r\n")) }
    end
    
    # Print all existing pastes
    def print
      puts "====== Pastes History ======".green
      unless @links.empty?
        @links.each_with_index { |l, i| puts "#{i+1}. #{l}" }
      else
        puts "your history is empty..."
      end
      puts "============================".green
    end
  end
end