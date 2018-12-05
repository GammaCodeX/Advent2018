
class Parser
  def self.parse text
    text.each_char.reduce([]) do |acc, char|
      if(acc.last == char.swapcase)
        acc.pop
      else
        acc.push char
      end
      acc
    end.join
  end
end
