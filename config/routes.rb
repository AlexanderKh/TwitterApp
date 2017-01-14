Rails.application.routes.draw do

  root to: 'home#index'

  namespace 'auth' do
    post :login, to: 'authentication#login'
    post :signup, to: 'authentication#register'

    post '/:provider', to: 'o_auth#callback'
    get '/:provider', to: 'o_auth#callback'
  end

  namespace 'api' do
    resources :favourites

    resources :tweets do
      member do
        post 'like', to: 'tweets#like'
        post 'unlike', to: 'tweets#unlike'
      end

      resources :comments
    end

    resources :users do
      member do
        post 'follow', to: 'users#follow'
        post 'unfollow', to: 'users#unfollow'
      end
    end
  end

  get '*path' => 'home#index'
end
