Rails.application.routes.draw do
  get 'jobseekers/new'

  # Routes for error pages
  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#server_errors"
end
