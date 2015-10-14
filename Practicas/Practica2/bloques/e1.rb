# Escribir metodo que reciva un bloque, lo invoque y retorne si el
# valor de retorno del bloque fue nil

def nil_output?(&block)

  ret = block.call

  if ret != nil
    false
  else
    true
  end
end

#probando

nil_output? { } # => true

nil_output? { puts 'sarasa' } # => true

nil_output? { 'SARASA' } # => false
