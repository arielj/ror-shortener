Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get :top, to: 'top#index'

  post :url, to: 'shortener#shorten'

  get ":encoded", to: 'expander#expand', as: :shortened
end
