Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :jobs do
    collection do
      get :search
    end
    resources :resumes
  end

  namespace :admin do
    resources :jobs do
    member do
      post :hide
      post :publish
    end
    resources :resumes
    end
  end
end
