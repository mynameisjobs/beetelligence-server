Rails.application.routes.draw do
  resources :searchterms
  resources :competitors
  resources :competitor_prices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
