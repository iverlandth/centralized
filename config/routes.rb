Rails.application.routes.draw do

  devise_for :users
  resources :churches
  scope "/:locale/:church_id" do
    resources :blogs
    resources :sub_events
    resources :events
    resources :meetings
    resources :petitions
    resources :members

  end


  get 'home/index'
  get 'home/welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
