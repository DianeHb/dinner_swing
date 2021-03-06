Rails.application.routes.draw do
  devise_for :users
  scope '(:locale)', locale: /fr/ do
    root to: 'pages#home'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :cities, only: [:show] do
      resources :events, only: [:new, :create, :show] do
        resources :participants, only: [:create, :destroy]
      end
    end
  end
end
