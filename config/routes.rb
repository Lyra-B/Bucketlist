Rails.application.routes.draw do
  devise_for :travellers

  resource :bucket_list, :only => :show

  root 'welcome#index'
end
