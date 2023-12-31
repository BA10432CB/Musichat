Rails.application.routes.draw do
  namespace :admin do
    get 'home' => 'homes#top'
    resources :users,     only: [:index, :show, :edit, :update]
    resources :posts,     only: [:index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    resources :songs,     only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :genres,    only: [:create, :index, :edit, :update, :destroy]
    resources :composers, only: [:create, :index, :edit, :update, :destroy]
    get 'search' => 'searches#search'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions:      'public/sessions'
  }

  devise_scope :user do
    post "public/guest_sign_in", to: "public/sessions#guest_sign_in"
    get '/users', to: 'public/registrations#new'
  end

  scope module: :public do
    resources :users,     only: [:show, :edit, :update] do
      member do
        get :favorite
      end
    end
    resources :posts,     only: [:new, :create, :index, :show, :destroy] do
      resource  :favorites,     only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :songs,     only: [:index, :show]
    resources :composers, only: [:index]
    resources :genres,    only: [:index, :show]
    get   'user/unsubscribe' => 'users#unsubscribe'
    patch 'user/withdrawal' => 'users#withdrawal'
    get   'search' => 'searches#search'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'
end
