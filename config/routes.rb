Rails.application.routes.draw do
  get 'sign_in' => 'session#new', as: :sign_in
  post 'sign_in' => 'session#create'

  root 'home#show'

  namespace :admin do
    root "slides#control"
  end
end
