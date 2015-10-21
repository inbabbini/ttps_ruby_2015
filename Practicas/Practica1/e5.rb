def contar(str,sub_str)

  if str == nil or sub_str == nil
    raise TypeError, 'Null parameters are not allowed'
  end

  if str.size > 0 and sub_str.size > 0
    str.downcase.scan(sub_str.downcase).size
  else
    0
  end
end
