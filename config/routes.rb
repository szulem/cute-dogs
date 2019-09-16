Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'
  get 'dogs/secured'
  devise_for :users
  
  root to: "home#index"

  resources :dogs do
    member do
      put "like" => "dogs#upvote"
    end
  end

end
