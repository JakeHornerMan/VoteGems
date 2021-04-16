Rails.application.routes.draw do
  
  #root screen
  root to: "elections#index"

  #GET /about
  get "about", to: "about#index"

  get "sign_up", to: "registrations#new"

  post "sign_up", to: "registrations#create"

  delete "logout", to: "sessions#destroy"

  get "sign_in", to: "sessions#new"

  post "sign_in", to: "sessions#create"

  get "password", to: "passwords#edit", as: :edit_password

  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"

  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"

  patch "password/reset/edit", to: "password_resets#update"

  get "create", to: "elections#new"

  get "search/elections", to: "elections#search"

  post "create", to: "elections#create"

  get "create/candidates", to: "candidates#new"
  post "create/candidates", to: "candidates#create"
  post "create/candidates", to: "candidates#finish"
  get "view/candidates", to: "candidates#view"

  put "like", to: "candidates#upvote"
  put "unlike", to: "candidates#downvote"

  get "view/elections", to: "elections#view"

  get "select/elections", to: "elections#select"



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
