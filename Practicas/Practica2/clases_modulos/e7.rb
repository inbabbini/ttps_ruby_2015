#creando un mixin
module Opposable
  def opposite
    !self
  end
end

#agregandoselo a las clases

# class FalseClass
#   include Opposable
# end
#
# class TrueClass
#   include Opposable
# end

#testeando

# true.opposite #=> false
# false.opposite #=> true
#
# true.opposite.opposite #=> true
# false.opposite.opposite #=> false
