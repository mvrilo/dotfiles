IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end

  # copy string to clipboard - osx only
  def pbcopy
    s = to_s
    `pbcopy <<< "#{s}"`
    s
  rescue
  end
end

def reload_irb
  load File.expand_path('~/.irbrc')
end

# from github.com/rkh/dotfiles
def sh(*args)
  system(
    args.inject('') do |cmd, arg|
      cmd << ' ' unless cmd.empty?
      str = arg.to_s
      if arg.is_a? Symbol
        cmd << '-' if str.length > 1
        cmd << '-'
      end
      cmd << str
    end
  )
end

%w[clear pwd ls cat ping wget curl bash ifconfig].each do |cmd|
  eval %(
    def #{cmd}(*args)
      sh '#{cmd}', *args
    end
  )
end

%w[rubygems hirb awesome_print].each do |gem|
  begin
  rescue LoadError
    puts "Gem '#{gem}' could not be loaded."
  end
end

Hirb.enable if defined? Hirb
AwesomePrint.irb! if defined? AwesomePrint

if defined? ::ActiveRecord
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger.level = Logger::DEBUG
end
