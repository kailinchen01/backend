Rails.application.routes.draw do
  resources :profile_photos
  resources :users
  resources :deceased_images
  resources :deceased_posts
  resources :users

  resources :markers do
    resources :reports, only: [:index]
  end
  resources :reports, except: [:index]
  resources :place_images
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
