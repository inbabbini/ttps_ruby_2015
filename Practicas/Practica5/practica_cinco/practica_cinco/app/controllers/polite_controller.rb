class PoliteController < ApplicationController
  def salute
    @salute = ["Holis", "Ahoy", "BUONGIORNO", "Guenas", "Aloha"].sample
    @inflect_test = 'Bacanal'.pluralize
  end
end
