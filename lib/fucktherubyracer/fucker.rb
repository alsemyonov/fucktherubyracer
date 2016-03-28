require 'bundler'
require 'erubis'
require 'tempfile'

module Fucktherubyracer
  class Fucker
    def initialize
    end

    def fuck(gem_name, version = nil)
      spec = if version
               Gem::Specification.new(gem_name, version)
             else
               lockfile_parser.specs.find { |spec| spec.name == gem_name }
             end

      generate(spec)
    end

    def generate(spec)
      input = File.read(File.join(File.expand_path('../../../', __FILE__), 'data/template.gemspec.erb'))
      eruby = Erubis::Eruby.new(input)

      result = eruby.result(binding)

      file = Tempfile.create("#{spec.name}.gemspec")
      file.write(result)
      file.close
      system "gem build #{file.path}"
      gem = "#{spec.name}-#{spec.version}.gem"
      system "gem install #{gem} && rm #{gem}; rm #{file.path}"
    end

    attr_writer :lockfile

    # @return [String]
    def lockfile
      @lockfile ||= Bundler.default_lockfile
    end

    private

    # @return [Bundler::LockfileParser]
    def lockfile_parser
      @lockfile_parser ||=
        begin
          lock = Bundler.read_file(lockfile)
          Bundler::LockfileParser.new(lock)
        end
    end
  end
end
