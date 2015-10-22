require 'minitest/autorun'
require 'minitest/spec'
require_relative 'e5methods.rb'

describe '#expansor' do

  # Casos de prueba con situaciones y/o entradas de datos esperadas
  describe 'Casos felices' do

    describe 'cuando la entrada es el string "a"' do

      it 'debe devolver "a"' do

        assert_equal('a', expansor('a'))

      end

    end
    describe 'cuando la entrada es el string "f"' do

      it 'debe devolver "ffffff"' do

        assert_equal('ffffff', expansor('f'))

      end

    end
    describe 'cuando la entrada es el string "escoba"' do
      it 'debe devolver "eeeeessssssssssssssssssscccooooooooooooooobba"' do

        assert_equal('eeeeessssssssssssssssssscccooooooooooooooobba', expansor('escoba'))

      end
    end

  end

  # Casos de pruebas sobre situaciones inesperadas y/o entradas de datos anómalas
  describe 'Casos tristes' do

    describe 'cuando la entrada no es un string' do

      it 'debe disparar una excepción estándar con el mensaje "La entrada no es un string"' do

        [Hash.new, 22.31, 21, Array.new, :nope].each do |argument|
          exception = assert_raises(StandardError) { expansor(argument) }
          assert_equal("La entrada no es un string", exception.message)
        end

      end

    end

    describe 'cuando la entrada es el string vacío' do

      it 'debe disparar una excepción estándar con el mensaje "El string es vacío"' do

        exception = assert_raises(StandardError) { expansor('') }
        assert_equal("El string es vacío", exception.message)

      end

    end

    describe 'cuando la entrada es el string "9"' do

      it 'debe disparar un excepción estándar con el mensaje "El formato del string es incorrecto"' do

        exception = assert_raises(StandardError) { expansor('9') }
        assert_equal("El formato del string es incorrecto", exception.message)

      end

    end

    describe 'cuando la entrada es el string "*"' do

      it 'debe disparar una excepción estándar con el mensaje "El formato del string es incorrecto"' do

        exception = assert_raises(StandardError) { expansor('*') }
        assert_equal("El formato del string es incorrecto", exception.message)

      end

    end

  end

end
