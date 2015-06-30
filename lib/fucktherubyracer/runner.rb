require 'thor'

module Fucktherubyracer
  class Runner < Thor
    desc 'fuck GEM_NAME', 'Reads dependency info from Gemfile.lock and installs fake gem'
    def fuck(gem_name)
      require 'fucktherubyracer/fucker'
      fucker = Fucktherubyracer::Fucker.new
      fucker.fuck(gem_name)
    end
  end
end
