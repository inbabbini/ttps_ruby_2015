require 'minitest/spec'
require 'minitest/autorun'

require_relative '../../Practica2/clases_modulos/e4.rb' #Countable module

#=====================================================================
# Tests for Countable module
#=====================================================================


describe 'Countable module' do

  # Testing in an exisiting class

  describe 'When included in Array class, tracking #sort and #size' do

    class Array
      include Countable
      count_invocations_of(:sort)
      count_invocations_of(:size)
    end

    TEST_ARRAY = [10,2,3.4]

    describe 'after sorting an array 3 times' do

      3.times{ TEST_ARRAY.sort }

      it ' #invoked?(:sort) should return true' do

        assert(TEST_ARRAY.invoked?(:sort))

      end

      it 'invoked_times should return 3' do

        assert_equal(3,TEST_ARRAY.invoked_times(:sort))

      end

    end

    describe 'after sending #size to an array 5 times' do

      5.times { TEST_ARRAY.size}

      it ' #invoked?(:size) should return true' do

        assert(TEST_ARRAY.invoked?(:size))

      end

      it '#invoked_times(:size) should return 5' do

        assert_equal(5, TEST_ARRAY.invoked_times(:size))

      end

    end


  end

  #Testing in an stub class, created with the sole purpose of testing

  describe 'When included in a new "Person" stub class' do

    class Person
      include Countable
      def say_hi
        'HEYOOOO!!'
      end
      def say_thanks
        'GRACIELA'
      end
      def say_bye
        'ADIOS, AMIGOS'
      end
      count_invocations_of(:say_hi)
      count_invocations_of(:say_bye)
    end

    TEST_PERSON = Person.new


    describe 'before invoking any methods' do


      it ' #invoked?(:say_hi) should return false' do

        refute(TEST_PERSON.invoked?(:say_hi))

      end

      it '#invoked_times(:say_hi) should return 0' do

        assert_equal(0, TEST_PERSON.invoked_times(:say_hi))

      end

      it ' #invoked?(:say_bye) should return false' do

        refute(TEST_PERSON.invoked?(:say_bye))

      end

      it '#invoked_times(:say_bye) should return 0' do

        assert_equal(0, TEST_PERSON.invoked_times(:say_bye))

      end

      it 'invoked?(:say_thanks) should raise an exeption' do

        assert_raises(RuntimeError) { TEST_PERSON.invoked?(:say_thanks) }

      end

      it '#invoked_times(:say_thanks) should raise an exeption' do

        assert_raises(RuntimeError) { TEST_PERSON.invoked_times(:say_thanks) }


      end

    end

    describe 'after invoking 3 times #say_hi, 0 times #say_bye, 2 times #say_thanks' do

      3.times { TEST_PERSON.say_hi }
      2.times { TEST_PERSON.say_thanks }

      it ' #invoked?(:say_hi) should return true' do

        assert(TEST_PERSON.invoked?(:say_hi))

      end

      it '#invoked_times(:say_hi) should return 3' do

        assert_equal(3, TEST_PERSON.invoked_times(:say_hi))

      end

      it ' #invoked?(:say_bye) should return false' do

        refute(TEST_PERSON.invoked?(:say_bye))

      end

      it '#invoked_times(:say_bye) should return 0' do

        assert_equal(0, TEST_PERSON.invoked_times(:say_bye))

      end

      it 'invoked?(:say_thanks) should raise an exeption' do

        assert_raises(RuntimeError) { TEST_PERSON.invoked?(:say_thanks) }

      end

      it '#invoked_times(:say_thanks) should raise an exeption' do

        assert_raises(RuntimeError) { TEST_PERSON.invoked_times(:say_thanks) }

      end

    end

  end

  #Testing behavior of instances when tracked methods have not been invoked

  describe 'When method being counted has not been invoked yet' do

    describe 'sending #invoked? to it' do

      it 'should return false' do

      end


    describe 'sending #invoked_times to it' do

      it 'should return 0' do

      end

    end

  end

  # Testing initialization of the mixin once included

  describe 'When mixing in the module' do

    describe 'including class' do

      it 'should respond to method #count_invocations_of' do

      end

    end

    describe 'intances of including class' do

      it 'should respond to #invoked?' do

      end

      it 'should respond to #invoked_times' do

      end

    end

  end

  # Testing various scenarios

  describe 'When' do

    describe 'using #invoked? with a non tracked method' do

    end

    describe 'using #invoked_times with a non tracked method' do

    end

  end

end

end
