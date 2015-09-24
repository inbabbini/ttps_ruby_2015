def sum_35_mul_to(tope)

  (1..tope).to_a.inject(0) do |tot, num|
    ((num % 3 == 0) or (num % 5 == 0)) ? tot + num : tot
  end

end
