# ::prepend(str) para insertar str adelante del string
def contar_palabra(str,sub_str)

  if str.size > 0 and sub_str.size > 0
    str.downcase.scan(/\w+/).select {|word| word == sub_str.downcase}.size
  else
    puts 0
  end
end
