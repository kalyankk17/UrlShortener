Rails.application.routes.draw do
  devise_for :users

  get 'shortened_urls/index'
  get 'shortened_urls/show'
  post 'shortened_urls', to: 'shortened_urls#create'

  get "/:short_url", to: "navigate#index"

  root "dashboard#index"

end
