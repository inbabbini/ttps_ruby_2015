#Codigo del enunciado
require 'matrix'

class Image

  attr_accessor :data, :size

  def initialize(data = nil, size = 1024)
    self.size = size
    self.data = data || Matrix.build(size) { Math::PI }
  end

  def header_bytes
    Matrix.rows([data.first(size)])
  end

  # Distintos filtros de imágenes:
  def filter_a
    Image.new data.map { |e| e ** 1.2 }
  end

  def filter_b
    Image.new data.map { |e| e ** 1.4 }
  end

  def filter_c
    Image.new data.map { |e| e ** 1.8 }
  end

  def filter_d
    Image.new data.map { |e| e ** 2 }
  end

  def filter_e
    Image.new data.map { |e| e ** 2.2 }
  end

  def filter_f
    Image.new data.map { |e| e ** 2.4 }
  end

  #- Fin de filtros
  def all_filters
    ('a'..'f').inject(self) do |pipe, type|
    pipe.public_send "filter_#{type}"
    end
  end

end

image = Image.new
image.filter_a.filter_c.filter_e
# => Esto no realiza ningún cálculo.
image.filter_a.filter_c.filter_e.header_bytes
# => Esto sí realiza cálculos para obtener la info de la cabecera.

# Resolucion:

# La idea seria rehacer la clase de manera tal que no se hagan tantos
# calculos todo el tiempo, solo cuando es necesario, es decir, deveria
# hacer los calculos ON DEMAND. Por esto, intuimos que la idea es
# convertir sus metodos en LAZY a travez del uso de ENUMERADORES

# Por simplicidad, agregamos a la clase ENUMERATOR un metodo para
# trabajar sobre enumeradores lazy, particularmente un LAZY_COLLECT

class Enumerator
  def lazy_collect(&block)
    Enumerator.new do |yielder|
      self.each do |element|
        output = block.call(element)
        yielder.yield output
      end
    end
  end
end

# Esto nos permitirá hacer un collect sobre un enumerador lazy, es decir
# aplicar un filtro sobre los elementos del enumerador lazy ON DEMAND

# Ahora, modificamos la clase para que haga uso de esto

require 'matrix'

class Image

  attr_accessor :data, :size

  def initialize(data = nil, size = 1024)
    self.size = size
    self.data = data || Matrix.build(size) { Math::PI }.to_enum
  end

  def header_bytes
    Matrix.rows([data.first(size)])
  end

  # Distintos filtros de imágenes:
  def filter_a
    self.data = self.data.lazy_collect { |e| e ** 1.2 }
    self
  end

  def filter_b
    self.data = self.data.lazy_collect { |e| e ** 1.4 }
    self
  end

  def filter_c
    self.data = self.data.lazy_collect { |e| e ** 1.8 }
    self
  end

  def filter_d
    self.data = self.data.lazy_collect { |e| e ** 2 }
    self
  end

  def filter_e
    self.data = self.data.lazy_collect { |e| e ** 2.2 }
    self
  end

  def filter_f
    self.data = self.data.lazy_collect { |e| e ** 2.4 }
    self
  end
  #- Fin de filtros

  def all_filters
    ('a'..'f').inject(self) do |pipe, type|
    pipe.public_send "filter_#{type}"
    end
  end

end

# El problema con esta implementacion es que trabaja sobre la misma instancia
# como si los metodos fuesen !, por lo que otra alternativa es:


require 'matrix'

class Image

  attr_accessor :data, :size

  def initialize(data = nil, size = 1024)
    self.size = size
    self.data = data || Matrix.build(size) { Math::PI }.to_enum
  end

  def header_bytes
    Matrix.rows([data.first(size)])
  end

  # Distintos filtros de imágenes:
  def filter_a
    Image.new(self.data.lazy_collect { |e| e ** 1.2 },self.size)
  end

  def filter_b
    Image.new(self.data.lazy_collect { |e| e ** 1.4 },self.size)
  end

  def filter_c
    Image.new(self.data.lazy_collect { |e| e ** 1.8 },self.size)
  end

  def filter_d
    Image.new(self.data.lazy_collect { |e| e ** 2 },self.size)
  end

  def filter_e
    Image.new(self.data.lazy_collect { |e| e ** 2.2 },self.size)
  end

  def filter_f
    Image.new(self.data.lazy_collect { |e| e ** 2.4 },self.size)
  end
  #- Fin de filtros

  def all_filters
    ('a'..'f').inject(self) do |pipe, type|
    pipe.public_send "filter_#{type}"
    end
  end

end
