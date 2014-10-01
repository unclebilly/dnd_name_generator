$: << File.join(File.dirname(__FILE__))
require "dnd_name_generator/version"

module DndNameGenerator
  class BashHistory
    def tokens
      unless @tokens 
        @tokens = []
        File.open(File.join(ENV['HOME'], ".bash_history")).each_line do |line|
          line = line.gsub(/[^A-Za-z\s\/]/,'')
          t = line.split(/\s+|\//)
          @tokens.concat(t)
        end
        @tokens = @tokens.reject{|t| t.length < 3}
      end
      @tokens
    end

    def generate
      r = rand(tokens.length)
      first, last = tokens[r..(r+1)]
      if first == last
        last = tokens[rand(tokens.length)]
      end
      "#{first.capitalize} #{last.capitalize}"
    end
  end

  def generate(num)
    num = (num.nil? ? 1 : num.to_i)
    h=BashHistory.new
    num.times.map { h.generate }
  end
  module_function :generate
end
