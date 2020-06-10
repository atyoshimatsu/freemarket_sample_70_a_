Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  } 

  root 'items#index'
  resources :items, only: [:index, :new, :show]
  resources :users, only: :show
  resources :cards, only: [:new, :show]

  resources :users do
    resources :addresses, only: [:new, :create, :show, :edit]
  end
  resources :purchases, except: [:index, :new, :create, :show, :edit, :update, :destroy] do
    member do
      get 'confirm'
      #Todo: 購入完了ページなどが以下に追加される
    end
  end
end
