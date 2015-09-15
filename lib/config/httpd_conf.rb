require_relative 'configuration'

# Parses, stores, and exposes the values from the httpd.conf file
module WebServer
  class HttpdConf < Configuration
    def initialize(httpd_file_content)
      @httpd_file_content = httpd_file_content
      @hash = Hash.new
      @httpd_file_content.split("\n").each do |pair|
        key,value = pair.split(" ")
        @hash[key] = value
      end
      #Line below prints key/value pairs to console for testing
      #@hash.each {|key, value| puts "KEY is [#{key}] VALUE is [#{value}]\n\n" }
    end

    # Returns the value of the ServerRoot
    def server_root 
      @server_root = @hash.fetch("ServerRoot").sub!("\"", "").chomp("\"")
      return @server_root
    end

    # Returns the value of the DocumentRoot
    def document_root
      @document_root = @hash.fetch("DocumentRoot").sub!("\"", "").chomp("\"")
      return @document_root
    end

    # Returns the directory index file
    def directory_index
      @directory_index = @hash.fetch("DirectoryIndex")
      return @directory_index
    end

    # Returns the *integer* value of Listen
    def port
      @port = @hash.fetch("Listen")
      return @port.to_i
    end

    # Returns the value of LogFile
    def log_file
      @log_file = @hash.fetch("LogFile").sub!("\"", "").chomp("\"")
      return @log_file      
    end

    # Returns the name of the AccessFile 
    def access_file_name
      @access_file_name = @hash.fetch("AccessFileName")
      return @access_file_name
    end

    # Returns an array of ScriptAlias directories
    def script_aliases
    end

    # Returns the aliased path for a given ScriptAlias directory
    def script_alias_path(path)
    end

    # Returns an array of Alias directories
    def aliases
    end

    # Returns the aliased path for a given Alias directory
    def alias_path(path)
    end
  end
end
