#funcion
def reemplazar(string)
  string.gsub(/[{}]/, '{' => 'do\n', '}' => '\nend')
end
