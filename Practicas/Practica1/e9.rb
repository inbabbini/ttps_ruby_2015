def string_array_long(string_array)

  #validation
  string_array.each do |string|
    if string.class != String
      raise TypeError, 'Invalid input'
    end
  end

  #action
  string_array.map { |string| string.size }

end
