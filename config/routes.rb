Fightingmuskrats::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'user_sessions' }
  devise_for :administrators, :controllers => { :sessions => 'administrator_sessions' }

  # See how all your routes lay out with "rake routes"

  authenticated :administrator do
    root :to => "project_managements#index"
  end

  root :to => 'projects#index'

  resources :projects

  resources :project_managements, only: [:index] do
    delete 'remove_user_from_project'
  end

  resources :user_managements, only: [:index, :destroy]

  resources :requirements_documents, only: [:index] do
    resources :use_cases
  end

end
