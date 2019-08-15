class SessionsController < ApplicationController
  def new
    @membertype = params[:membertype]
    
  end
  
  def create
    if params[:membertype] == "employer" 
      flash.now[:danger] == "it's sendin the param"
      render 'new'
    else
      flash.now[:danger] == "it's not sending the param we wnated"
      render 'new'
    end
  end
  
  def destroy
  
  end
end
