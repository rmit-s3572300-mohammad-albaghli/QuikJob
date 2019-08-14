Rails.application.routes.draw do
  #routes for static pages
  
  

  get '/home', to: 'static_pages#Home'
  get '/about', to: 'static_pages#About'  
  get '/contact', to: 'static_pages#Contact'
  
  #get 'static_pages/Home'
  #get 'static_pages/About'
  #get 'static_pages/Contact'
  root 'static_pages#Home'

  # Routes for error pages
  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#server_errors"
end
