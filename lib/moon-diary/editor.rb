require 'fileutils'
require 'tempfile'
require 'json'
require 'date'
require 'highline/import'

module DiaryEditor
	class Diary
		CONFIGURATION_FILE = File.expand_path("~/.oneday")
		attr_accessor :configuration
		def initialize(*args, opts)
			time = Time.new
			@month =  time.month
			@year = time.year
			say "current month:#{@month}"
			say "current Year:#{@year}"
		end

		def run
			configure
		end
		
		def configure
			FileUtils.touch(CONFIGURATION_FILE) unless File.exist?(CONFIGURATION_FILE)
			@configuration = JSON::load(File.open(CONFIGURATION_FILE)) || {}
			diary_path unless @configuration['path']
		end

		def diary_path
			path = ask("You should input the directory of diary.") { |q| q.default = "none" }
			@configuration['path'] = path
			write_configuration
		end
		
		def write_configuration
			File.open(CONFIGURATION_FILE, "w") do |file|
				file.write @configuration.to_json
		  end
		end

	end
end
