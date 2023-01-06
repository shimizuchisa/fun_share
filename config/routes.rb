Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
  end
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    resources :charges, only: [:index]
    resources :events, only: [:index, :show, :edit, :update] do
      resources :comments, only: [:index, :show, :update]
      resources :charges, only: [:index, :show, :update]
    end
  end

  # 会員用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :user do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root 'homes#top'
    get 'users/mypage' => 'users#show'
    get 'users/mypage/edit' => 'users#edit'
    patch 'users/mypage' => 'users#update'
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'
    resources :events do
      resource :favorites, only: [:create, :destroy]
      resource :charges, only: [:create, :destroy]
      # resource=単数形→ /:idがURLに含まれなくなる
      # 1人のユーザーは1つのタスクに対して1担当するため
      resources :comments, only: [:create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
