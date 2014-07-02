# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "moon-diary/version"

Gem::Specification.new do |gem|

	gem.name = 'moon-diary'
	gem.version = MoonDiary::VERSION
	gem.date = '2014-06-26'
	gem.summary = "a simple diary command"
	gem.description = "a simple diary command !"
	gem.authors = ["sheldon huang"]
	gem.email = 'sheldon.zen@gmail.com'
	gem.homepage = "https://github.com/morisunshine/diary_command.git"
	gem.license = 'MIT'
	gem.require_paths = ["lib"]
	gem.files = `git ls-files`.split($/)
	gem.executables = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }

end
