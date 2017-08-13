Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies, shallow: true do
    resources :reviews, only: [ :create, :show, :destroy, :update ]
  end

end
