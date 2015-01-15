Rails.application.routes.draw do

  resources :posts

#I can't remember if I made this for an extra assignment. May have to delete.
#  get 'welcome/contact'

  get 'about' => 'welcome#index'

  root to:'welcome#index'


end
