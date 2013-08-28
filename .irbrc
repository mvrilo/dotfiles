IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

class Object
  def pbcopy
    s = self.to_s
    `pbcopy <<< "#{s}"`
    s
  end
end

def reload_irb
  load File.expand_path("~/.irbrc")
end

# Based on rue's irbrc => http://pastie.org/179534
def quick(repetitions=100, &block)
  require 'benchmark'

  Benchmark.bmbm do |b|
    b.report {repetitions.times &block} 
  end
  nil
end

# from github.com/rkh/dotfiles
def sh *args
  system(
    args.inject("") do |cmd, arg|
      cmd << " " if cmd.length > 0
      str = arg.to_s
      if arg.is_a? Symbol
        cmd << "-" if str.length > 1
        cmd << "-"
      end
      cmd << str
    end
  )
end

%w(clear pwd ls cat ping wget curl bash ifconfig).each do |cmd|
  eval %(
    def #{cmd}(*args)
      sh '#{cmd}', *args
    end
  )
end

%w(rubygems wirble hirb).each do |gem|
  begin
    require gem
  rescue LoadError
    puts "Gem '#{gem}' could not be loaded."
  end
end

if defined? Wirble
  Wirble.init
  Wirble.colorize
end

Hirb.enable if defined? Hirb

if defined? ::ActiveRecord
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger.level = Logger::DEBUG
end
