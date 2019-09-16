class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index
    @dogs = Dog.all.order("RANDOM()").limit(2)
  end
  
end
