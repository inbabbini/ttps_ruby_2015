def rot(string, rotn)

# ['A'..'Z'] no deberia instanciar un arreglo "chars" de A a Z?
  upperRange = ('A'..'Z').to_a
  lowerRange = ('a'..'z').to_a
  n_str = ''

  string.chars.each do |c|
    if /[[:upper:]]/.match(c)
      n_str  << upperRange[ (upperRange.index(c)+rotn) % 26]

    elsif /[[:lower:]]/.match(c)
       n_str << lowerRange[ (lowerRange.index(c)+rotn) % 26]
    else
      n_str << c
    end
  end
  n_str
end
