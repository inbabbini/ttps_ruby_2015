
# Method #incrementar

def incrementar(x, delta = 1)

  if (x.class == String)
    raise RuntimeError, 'Parameter should be a valid number'
  end

  x + delta

end

# Method #concatenar

def concatenar(*args)

  args.map { |a| a.to_s }.join(' ').split(' ').join(' ')

end
