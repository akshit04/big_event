Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get '/signup' => 'index#index'
  #get '/jobrequest' => 'index#index'
  #get '/committee' => 'index#index'
  #root 'staffs#index'
  root 'landing_page#index'
  resources :jobs, only: [:show, :edit, :update]
  resources :partnership, only: [:show]
  resources :job_year, only: [:show]
  
  get 'auth/:provider/callback', to: 'authentication#googleAuth'
  get 'auth/failure', to: redirect('/')
  get '/logout', to: 'authentication#logout'

  get '/dummy', to: 'partnership#check_user', as: 'check_user'
  get '/status', to: 'job_status#show'
  get '/dummy1', to: 'jobs#update_job_status', as: 'update_job_status'

  get '/users', to: 'users#index'
  post '/users/upload', to: 'users#upload', as: 'upload'
  
  post '/job_year/upload_jobs', to: 'job_year#upload_jobs', as: 'upload_jobs'
  
  #get "/jobrequest" => redirect("https://bigeventonline.tamu.edu/jobrequest"), :as => :jobrequest
  #get "/signup" => redirect("https://bigeventonline.tamu.edu/signup"), :as => :signup


end