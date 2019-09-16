class DogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dog, only: [:show, :upvote]

  def index
    @dogs = Dog.all.order('created_at DESC').page(params[:page])
    @dogs_limit = Dog.all.order("RANDOM()").limit(2)
  end

  def show
  end

  def secured
    @dogs = Dog.order('cached_votes_up DESC').page(params[:page])
  end

  #upvote from user
  def upvote
    @dog.upvote_from current_user
    redirect_back(fallback_location:"/")
  end

  private
    def set_dog
      @dog = Dog.find(params[:id])
    end

end
