Rails.application.routes.draw do
  namespace :admin do
    resources :songs, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :genres, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :composers, only: [:new, :create, :index, :edit, :update, :destroy]
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions:      'public/sessions'
  }

  scope module: :public do
    resources :users,     only: [:show, :edit, :update]
    resources :posts,     only: [:new, :create, :index, :show, :destroy] do
      resource  :favorites,     only: [:create, :destroy]
      resources :post_comments, only: [:create]
    end
    resources :songs,     only: [:index, :show]
    resources :composers, only: [:index]
    resources :genres,    only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'
end
