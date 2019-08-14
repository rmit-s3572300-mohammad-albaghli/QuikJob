Rails.application.routes.draw do
  # Routes for regular pages
  get 'jobseekers/new'
  get  '/employer_signup',  to: 'employers#new'
  post '/employer_signup',  to: 'employers#create'
  
  # Routes for error pages
  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#server_errors"
  
  resources :employers
end
