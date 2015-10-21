# Test Framework
require 'minitest/autorun'
require 'minitest/spec'

# P1
require_relative '../../Practica1/e4.rb' # gimme_time
require_relative '../../Practica1/e5.rb' # contar
require_relative '../../Practica1/e6.rb' # contar_palabras
require_relative '../../Practica1/e9.rb' # string_array_long

# P2
require_relative '../../Practica2/metodos/e1.rb' # sort_numeric_array
require_relative '../../Practica2/metodos/e2.rb' # sort_numeric_params
require_relative '../../Practica2/metodos/e4.rb' # stringify_params
require_relative '../../Practica2/clases_modulos/e5.rb' # Module Opposable, opposite
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
# Practica 3 - E9 - sort_numeric_array(numeric_array)
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

      descrive 'vacio' do

        it 'devería devolver un array vacio' do

          assert_equal([], sort_numeric_array([]))
          assert_equal([], sort_numeric_array(Array.new))


        end

      end

      describe 'solo con numeros' do

        it 'devería devolver un array con los numeros en orden ascendente' do

          assert_equal([1.5,3/4,2,3,10,55], sort_numeric_array([10,3,2,55,1.5,3/4]))
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
