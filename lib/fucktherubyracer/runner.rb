require 'thor'

module Fucktherubyracer
  class Runner < Thor
    desc 'fuck GEM_NAME', 'Reads dependency info from Gemfile.lock and installs fake gem'
    method_option :version, desc: 'Version to fuck'
    def fuck(gem_name)
      require 'fucktherubyracer/fucker'
      fucker = Fucktherubyracer::Fucker.new
      fucker.fuck(gem_name, options[:version])
    end
  end
end
