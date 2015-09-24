def rot13(string)

  n_str = ''
  string.chars.each {|c| c < 'n' ? c.tr!('a-m','n-z') : c.tr!('n-z','a-m')}.each {|c| n_str << c}
  n_str
end

def alternative_rot13(string)

  n_str = ''
  string.chars.each do | c |
    if /[[:upper:]]/.match(c)
      c < 'N' ? c.tr!('A-M','N-Z') : c.tr!('N-Z','A-M')
    else
      c < 'n' ? c.tr!('a-m','n-z') : c.tr!('n-z','a-m')
    end
  end
  .each {|c| n_str << c}
  n_str
end
