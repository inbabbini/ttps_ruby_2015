nums=[]
(100..999).each do |num|
  (100..999).each do |num2|
    if (num * num2).to_s == (num * num2).to_s.reverse
      nums << (num * num2)
    end
  end
end
puts nums.last
