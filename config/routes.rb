Rails.application.routes.draw do
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update] do
      resources :comments, only: [:index]
    end
    resources :charges, only: [:index]
    resources :events, only: [:index, :show, :edit, :update, :destroy] do
      delete 'comments/destroy_all' => 'comments#destroy_all'
      resources :comments, only: [:index, :show, :update, :destroy]
      resources :charges, only: [:show, :update, :destroy]
    end
    resources :charges, only: [:index]
    resources :favorites, only: [:index]
  end

  # 会員用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # ゲスト会員用
  devise_scope :user do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root 'homes#top'
    get 'users/mypage' => 'users#show'
    get 'users/mypage/edit' => 'users#edit'
    patch 'users/mypage' => 'users#update'
    get 'users/unsubscribe' => 'users#unsubscribe' #退会処理確認画面
    patch 'users/withdraw' => 'users#withdraw' #退会処理
    resources :events do
      resource :favorites, only: [:create, :destroy]
      resource :charges, only: [:create, :destroy]
      resources :comments, only: [:create]
    end
    resources :charges, only: [:index]
    resources :favorites, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
