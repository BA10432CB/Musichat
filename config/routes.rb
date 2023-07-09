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
    get 'users/my_profile'      => 'users#show'
    get 'users/my_profile/edit' => 'users#edit'
    patch 'users/my_profile'    => 'users#update'
    resources :posts, only: [:new, :create, :index, :show, :destroy]
    resources :songs, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'
end
