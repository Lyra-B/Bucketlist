Rails.application.routes.draw do
  devise_for :travellers

  resource :bucket_list, :only => :show

  resources :destinations, :only => [:create, :destroy]

  resources :activities, :only => [:create, :destroy, :index]

  root 'welcome#index'
end
