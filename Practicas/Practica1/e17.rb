def fibonacci_to(max)
  term_1,term_2 = 0,1
  sig = 0
  while term_2 <= max
    if block_given?
      yield term_2
    end
      sig = term_1 + term_2
      term_1 = term_2
      term_2 = sig
  end
end

sum = 0
fibonacci_to(4000000) {|fib| if fib.even? then sum+=fib end}
puts sum
