Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :users, only: [:index, :show, :update]
    resources :tasks, only: [:index, :show, :edit, :update] do
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

  scope module: :public do
    root 'homes#top'
    get 'users/mypage' => 'users#show'
    get 'users/mypage/edit' => 'users#edit'
    patch 'users/mypage' => 'users#update'
    resources :tasks do
      resource :charges, only: [:create, :destroy]
      # resource=単数形→ /:idがURLに含まれなくなる
      # 1人のユーザーは1つのタスクに対して1回のみ担当するだけでいいため
      resources :comments, only: [:create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
