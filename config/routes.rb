Rails.application.routes.draw do
  devise_for :travellers

  resource :bucket_list, only: [:show] do
    member do
      get "activities/order", to: :order
    end
  end

  resources :destinations, :only => [:create, :destroy]

  resources :activities, :only => [:create, :destroy, :index]

  root 'welcome#index'
end
