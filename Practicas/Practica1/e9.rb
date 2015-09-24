def string_array_long(string_array)
  r_array = []
  string_array.each do |string|
    r_array.push(string.size)
  end
  r_array
end
