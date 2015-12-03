class PoliteController < ApplicationController
  def salute
    @salute = ["Holis", "Ahoy", "BUONGIORNO", "Guenas", "Aloha"].sample
  end
end
