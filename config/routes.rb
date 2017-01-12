Rails.application.routes.draw do

  root to: 'home#index'

  namespace 'auth' do
    post :login, to: 'authentication#login'
    post :signup, to: 'authentication#register'
  end

  namespace 'api' do
    resources :tweets do
      member do
        patch 'like', to: 'tweets#like'
        patch 'unlike', to: 'tweets#unlike'
      end
    end
  end

  get '*path' => 'home#index'
end
