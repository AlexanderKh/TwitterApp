Rails.application.routes.draw do

  root to: 'home#index'

  namespace 'auth' do
    post :login, to: 'authentication#login'
    post :signup, to: 'authentication#register'
  end

  namespace 'api' do
    resources :tweets do
      member do
        post 'like', to: 'tweets#like'
        post 'unlike', to: 'tweets#unlike'
      end
    end

    resources :users do
      member do
        post 'follow', to: 'users#follow'
        post 'unfollow', to: 'users#unfollow'
      end
    end

    resources :favourites
  end

  get '*path' => 'home#index'
end
