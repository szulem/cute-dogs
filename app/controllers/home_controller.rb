class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @dogs = Dog.all.order('created_at DESC').limit(2)
  end
  
end
