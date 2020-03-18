Rails.application.routes.draw do
  root :to => 'home#top'

  get 'home/top'
  get 'home/search'

  resources :issues
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
