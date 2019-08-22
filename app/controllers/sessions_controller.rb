class SessionsController < ApplicationController
  def new
    @membertype = params[:membertype]
    
  end
  
  def create
    if params[:membertype] == "employer" 
      employer = Employer.find_by(email: params[:session][:email].downcase)
        if employer && employer.authenticate(params[:session][:password])
          log_in_employer employer
          flash[:success] = "You've successfully logged in!"
          redirect_to :controller => 'static_pages', :action => 'Home'
        else
          flash.now[:danger] = 'Invalid email/password combination!'
          redirect_to :membertype=> "employer"
        end
    elsif params[:membertype] == "jobseeker"
    jobseeker = Jobseeker.find_by(email: params[:session][:email].downcase)
        if jobseeker && jobseeker.authenticate(params[:session][:password])
          log_in_jobseeker jobseeker 
          flash[:success] = "You've successfully logged in!"
          redirect_to :controller => 'static_pages', :action => 'Home'
        else
          flash.now[:danger] = 'Invalid email/password combination!'
          redirect_to :membertype=> "jobseeker"
        end
    else 
      flash.now[:danger] = "There's an error in the URL, please try to log in again!"
      redirect_to root_url
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
