Rails.application.routes.draw do

   namespace :admin do
    root to: "homes#top"
  end

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources :users, only: [:edit, :create, :update, :destroy, :show]
    resources :posts, only: [:index, :edit, :create, :update, :destroy, :new, :show] do
      resources :post_comments, only: [:create, :destroy, :edit, :index, :update]
      resource :group_users, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end



  end




  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
