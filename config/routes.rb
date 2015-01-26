Rails.application.routes.draw do



  devise_for :users
  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :post, only: [] do
    resources :comments, only: [:create, :destroy]
  end


  get 'about' => 'welcome#index'

  root to:'welcome#index'

end
