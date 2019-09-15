class DogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @dogs = Dog.all.order('created_at DESC')
  end
  
end
