def common_substring(text_1, text_2)
  text_1.each_char.zip(text_2.each_char).map do |a,b|
    a if a == b
  end.join
end

