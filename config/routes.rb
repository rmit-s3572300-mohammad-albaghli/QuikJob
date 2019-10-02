Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'skills/new'
  get 'sessions/new'

  root 'static_pages#Home'
  # Routes for regular pages
  get 'jobseekers/new'
  get '/home', to: 'static_pages#Home'
  get '/about', to: 'static_pages#About'  
  get '/contact', to: 'static_pages#Contact'
  
  #Routes for employer model
  get  '/employer_signup',  to: 'employers#new'
  post '/employer_signup',  to: 'employers#create'

  #Routes for jobseeker model
  get '/jobseeker_signup', to: 'jobseekers#new'
  post '/jobseeker_signup', to: 'jobseekers#create'
  get '/jobseeker_edit_skills', to: 'jobseekers#edit_skills'
  post '/jobseeker_edit_skills', to: 'jobseekers#confirm_skills'
  patch '/jobseeker_add_skills', to: 'jobseekers#add_skills'
  post '/jobseeker_skill_delete', to: 'jobseekers#delete_skills'
  
  #login routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # Routes for job pages
  get '/create_job', to: 'jobs#new'
  post '/create_job', to: 'jobs#create'
  post '/job_apply', to: 'jobs#apply'
  get '/search', to: 'jobs#search'
  post '/search', to: 'jobs#search'
  post '/job_offer', to: 'jobs#offer'
  post '/job_close', to: 'jobs#close'
  post '/job_reopen', to: 'jobs#reopen'

  # Routes for error pages
  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#server_errors"
  
  # Routes for matching pages
  get '/match_jobseeker', to: "matches#match_js"
  get '/match_employer', to: "matches#match_em"
  
  resources :employers, :jobseekers
  resources :jobs, :skills
end
