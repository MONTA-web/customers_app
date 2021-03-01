Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :users,only:[:edit,:update]
  resources :customers do
    collection do
      get :search
      get :aggregate_result
      get :aggregate_search
    end
  end 
  get 'blogs/index'
end
