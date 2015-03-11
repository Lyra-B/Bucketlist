Rails.application.routes.draw do
  devise_for :travellers

  resource :bucket_list, :only => :show

  resources :destinations, :only => :create

  resources :activities, :only => [:create, :destroy]

  root 'welcome#index'
end
