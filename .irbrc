IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

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

%w(rubygems irb/completion pp hirb wirble).each do |gem|
  begin
    require gem
  rescue LoadError
    sh "gem install #{gem}"
  end
end

Wirble.init
Wirble.colorize
