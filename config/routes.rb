Rails.application.routes.draw do
  devise_for :travellers

  resource :bucket_list, :only => :show

  resources :destinations, :only => :create

  root 'welcome#index'
end
