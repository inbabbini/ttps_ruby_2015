def contar(str,sub_str)

  if str.size > 0 and sub_str.size > 0
    str.downcase.scan(sub_str.downcase).size
  else
    puts 0
  end
end
