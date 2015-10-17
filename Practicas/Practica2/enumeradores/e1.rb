#Hacer un enumerador que vaya dando los numeros de la serie de fibonacci

fib = Enumerator.new do |yielder|
  n1, n2 = 1, 1
  loop do
    yielder.yield n1
    n1, n2 = n2, n1+n2
  end
end

#probando

fib.first(10) # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
