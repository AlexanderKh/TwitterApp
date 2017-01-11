Rails.application.routes.draw do

  root to: 'home#index'

  namespace 'auth' do
    post :login, to: 'authentication#login'
    post :signup, to: 'authentication#register'
  end

  resources :tweets

  get '*path' => 'home#index'
end
