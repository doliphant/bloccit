Rails.application.routes.draw do



  devise_for :users
  resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :post, only: [] do
    resources :comments, only: [:create, :destroy]

      post '/up-vote' => 'votes#up_vote', as: :up_vote
      post '/down-vote' => 'votes#down_vote', as: :down_vote
  end


  get 'about' => 'welcome#index'

  root to:'welcome#index'

end
