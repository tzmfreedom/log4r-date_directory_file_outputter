require 'log4r/outputter/fileoutputter'
require 'log4r/staticlogger'

module Log4r
  class DateDirectoryFileOutputter < FileOutputter
    def initialize(name, hash = {})
      @file_path_pattern = hash[:file_path] || hash['file_path']
      @file_path = hash[:filename] = hash['filename'] = Time.now.strftime(@file_path_pattern)
      create_directory
      super
    end

    private

    def write(data)
      change if requires_change?
      super
    end

    def create_directory
      dir_path = File.dirname(@file_path)
      FileUtils.mkdir_p(dir_path)
    end

    def requires_change?
      new_file_path = Time.now.strftime(@file_path_pattern)
      new_file_path != @file_path
    end

    def change
      begin
        @out.close
      rescue
        Logger.log_internal { "DateDirectoryFileOutputter '#{@name}' could not close #{@filename}" }
      end
      @file_path = Time.now.strftime(@file_path_pattern)
      create_directory

      @out = File.new(@file_path, (@trunc ? 'wb' : 'ab'))
      Logger.log_internal { "DateDirectoryFileOutputter '#{@name}' now writing to #{@filename}" }
    end
  end
end