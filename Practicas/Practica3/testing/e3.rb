# Test Framework
require 'minitest/spec'
require 'minitest/autorun'

# P1
require_relative '../../Practica1/e4.rb' # gimme_time
require_relative '../../Practica1/e5.rb' # contar
require_relative '../../Practica1/e6.rb' # contar_palabras
require_relative '../../Practica1/e9.rb' # string_array_long

# P2
require_relative '../../Practica2/metodos/e1.rb' # sort_numeric_array
require_relative '../../Practica2/metodos/e2.rb' # sort_numeric_params
require_relative '../../Practica2/metodos/e4.rb' # stringify_params
require_relative '../../Practica2/clases_modulos/e7.rb' # Module Opposable, opposite
require_relative '../../Practica2/bloques/e1.rb' # nil_output?


#===================================================================
# Practica 1 - E4 - Method #gimme_time(time)
#===================================================================

describe '#gimme_time' do

  describe 'cuando no se le pasa ningun parametro' do

    it 'utiliza la hora actual' do
      assert_equal(gimme_time(Time.now), gimme_time())
    end

  end

  describe 'cuando los minutos son entre' do

    it '0 y 10 devuelve la hora "en punto"' do

      assert_equal('Son las 10 en punto', gimme_time(Time.new(2015,10,20,10,0)))
      assert_equal('Son las 10 en punto', gimme_time(Time.new(2015,10,20,10,5)))
      assert_equal('Son las 10 en punto', gimme_time(Time.new(2015,10,20,10,10)))

    end

    it '11 y 20 devuelve la hora "y cuarto"' do

      assert_equal('Son las 10 y cuarto', gimme_time(Time.new(2015,10,20,10,11)))
      assert_equal('Son las 10 y cuarto', gimme_time(Time.new(2015,10,20,10,15)))
      assert_equal('Son las 10 y cuarto', gimme_time(Time.new(2015,10,20,10,20)))

    end
  end
end

#===================================================================
# Practica 1 - E5 - Method #contar(str, substr)
#===================================================================


describe '#contar' do

  describe 'Cuando se le envia un string' do

    describe 'y un substring' do

      it 'nulo, deberia lanzar una exception' do

        assert_raises(TypeError) { contar('La Sarasasasa', nil) }

      end

      it 'vacio, deberia retornar 0 coincidencias' do

        assert_equal(0,contar('La Sarasasasa', ''))

      end

      it 'válido, debería retornar la cantidad de coincidencias del substr, case insensitive' do

        assert_equal(5,contar("La casa de la esquina tiene la puerta roja y la ventana blanca.", "la"))
        assert_equal(4,contar("La Sarasasasa", "sa"))
        assert_equal(3,contar('Ahi va la bala abarajala', 'la'))

      end

      it 'más largo que el string, deberia devolver 0' do

        assert_equal(0, contar('id','idiocincracia'))

      end

    end
  end
end

#===================================================================
# Practica 3 - E6 - Method #contar_palabras(string, substr)
#===================================================================

describe '#contar_palabras' do

  describe 'cuando se le pasa un string' do

    it 'y un substring válido, deberia contar sus apariciones como palabra' do

      assert_equal(4,contar_palabras("La casa de la esquina tiene la puerta roja y la ventana.",'la'))

    end

    it 'y un substring válido, deberia contar solo sus apariciones como palabra' do

      refute_equal(5,contar_palabras("La casa de la esquina tiene la puerta roja y la ventana blanca.",'la'))
      assert_equal(4,contar_palabras("La casa de la esquina tiene la puerta roja y la ventana blanca.",'la'))

    end

  end

end

#===================================================================
# Practica 3 - E9 - string_array_long(string_array)
#===================================================================

describe '#string_array_long' do

  describe 'Cuando se le pasa una array' do

    describe 'vacio' do

      it 'deberia devolver un arreglo vacio'do

        assert_equal( [] , string_array_long([]) )

      end

    end

    describe 'solo con N strings vacios' do

      it 'deberia devolver un array de N ceros' do

        assert_equal([0,0,0], string_array_long(['','','']))
        assert_equal([0,0,0], string_array_long(['',String.new,'']))
        refute_equal([], string_array_long(['','','']))

      end

    end

    describe 'solo con N strings válidos' do

      it 'deberia devolver un array de N números enteros, longitudes de los strings' do

        assert_equal([4, 6, 4, 12], string_array_long(['TTPS', 'Opción', 'Ruby', 'Cursada 2015']))
        assert_equal([0,1,5], string_array_long(['', ' ', '88 88']))

      end

    end

    describe 'solo con objetos no String' do

      it 'deberia lanzar una exception' do

        assert_raises(TypeError) { string_array_long([Hash.new,Array.new,1.1415,Fixnum]) }

      end

    end

    describe 'con objetos String y otros tipos' do

      it 'deberia lanzar una exception' do

        assert_raises(TypeError) { string_array_long(['mangalga', 'partusa', nil, Hash.new]) }

      end

    end

  end

end

#===================================================================
# Practica 2 - E1 - sort_numeric_array(numeric_array)
#===================================================================

describe '#sort_numeric_array()' do

  describe 'cuando se le envia' do

    describe 'algo que no es un array' do

      it 'deberia lanzar una exception' do

        assert_raises(TypeError) { sort_numeric_array(nil) }
        assert_raises(TypeError) { sort_numeric_array(Hash.new) }
        assert_raises(TypeError) { sort_numeric_array('array') }

      end

    end

    describe 'un array' do

      describe 'vacio' do

        it 'devería devolver un array vacio' do

          assert_equal([], sort_numeric_array([]))
          assert_equal([], sort_numeric_array(Array.new))


        end

      end

      describe 'solo con numeros' do

        it 'devería devolver un array con los numeros en orden ascendente' do

          assert_equal([1.5,2,3,10,55], sort_numeric_array([10,3,2,55,1.5]))
          assert_equal([1,2,3,4], sort_numeric_array([1,2,3,4]))
          assert_equal([1,2,3,4], sort_numeric_array([4,3,2,1]))
          assert_equal([-2,-1,0,1,2], sort_numeric_array([0,-1,2,-2,1]))

        end

      end

      describe 'con numeros y otros objetos' do

        it 'deveria lanzar una exception' do

          assert_raises(TypeError) {sort_numeric_array([nil, 1, 0, 'sarasa', Hash.new]) }

        end

      end

    end

  end

end

#===================================================================
# Practica 2 - E2 - sort_numeric_params(numeric_params)
#===================================================================

describe '#sort_numeric_params' do

  describe 'when no arguments are given' do

    it 'should raise an exception' do

      assert_raises(ArgumentError) {sort_numeric_params()}

    end

  end

  describe 'when arguments are given and' do

    describe 'all arguments are numbers' do

      it 'should return array containing all arguments in incremental order' do

        assert_equal([1,1.1,2,10,32], sort_numeric_params(10,2,1.1,1,32))
        assert_equal([-1,0,1], sort_numeric_params(0,-1,1))

      end

      describe 'and there are repeated numbers' do

        it 'should pack them together' do

          assert_equal([1,1,2,5,6,6,10.2,10.2,50], sort_numeric_params(2,5,6,10.2,1,1,6,50,10.2))
          assert_equal([0,0,0], sort_numeric_params(0,0,0))
        end

      end

    end

    describe 'all arguments are not numbers' do

      it 'should raise an exception' do

        assert_raises(TypeError) { sort_numeric_params('1','2',Hash.new) }

      end

    end

    describe 'arguments are mixed number and not numbers' do

      it 'should raise an exception' do

        assert_raises(TypeError) { sort_numeric_params('1','2',3,Hash.new,5) }

      end

    end

  end

end

#===================================================================
# Practica 2 - E4 - #stringify_params(params)
#===================================================================

describe '#stringify_params' do

  describe 'when no arguments are given' do

    it 'should raise an exeption' do

      assert_raises(ArgumentError) { stringify_params() }

    end

  end

  describe 'when arguments are given and' do

    describe 'argument is' do


      describe 'an array' do

        it 'should print "stringified_array --> representantion_length\n"' do

          output = capture_io do
            stringify_params([1,2,3])
          end

          assert_equal("[1, 2, 3] --> 9\n", output[0])
        end

      end

      describe 'a Fixnum' do

      end

      describe 'nil' do

      end

      describe 'a Hash' do

      end

      describe 'a Proc' do

      end

    end

    describe 'arguments are' do

      describe 'of various classes' do

        it 'should print a line like "stringified_object --> N" for each argument, where N is the lenght of the string representation' do

          output = capture_io do
            stringify_params([1,2,3],'hola',1,{key:'value'})
          end
          assert_equal("[1, 2, 3] --> 9\n"+"hola --> 4\n"+"1 --> 1\n"+"{:key=>\"value\"} --> 15\n", output[0])
        end

      end

    end

  end

end

#===================================================================
# Practica 2 - E14 - Module Opposable
#===================================================================

describe 'Module Opposable' do

  before do
    class FalseClass
      include Opposable
    end

    class TrueClass
      include Opposable
    end
  end

  describe 'When included' do

    it 'should define method #opposite into including class' do

      assert(TrueClass.method_defined?(:opposite))
      assert(FalseClass.method_defined?(:opposite))

    end

    describe 'instances of including class' do

      it 'should respond to #opposite' do

        assert(true.respond_to?(:opposite))
        assert(false.respond_to?(:opposite))

      end

      it 'should return their opposite when receiving #opposite' do

        assert_equal(false, true.opposite)
        refute_equal(true, true.opposite)

        assert_equal(true, false.opposite)
        refute_equal(false, false.opposite)

        assert_equal(!true, true.opposite)
        assert_equal(!false, false.opposite)

      end

    end

  end

end

#===================================================================
# Practica 2 - E16 -  #nil_output?(&block)
#===================================================================

describe '#nil_output' do


  describe 'when no block argument is passed' do

    it 'should raise an exception' do

      assert_raises(ArgumentError) { nil_output? }

    end

  end

  describe 'when block argument is passed' do

    it 'should return a boolean object (true or false)' do

      assert_instance_of(TrueClass,nil_output?{nil})
      assert_instance_of(FalseClass,nil_output?{'sarasa'})

    end

    describe 'and block returns nil' do

      it 'should return true' do

        assert(nil_output?{nil})
        assert_equal(true,nil_output?{nil})

      end

    end

    describe 'and block does no return nil' do

      it 'should return false' do

        refute(nil_output?{'sarasa'})
        assert_equal(false,nil_output?{'sarasa'})

      end

    end

  end

end
