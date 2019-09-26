class SessionsController < ApplicationController
  def new
    @membertype = params[:membertype]
    
  end
  
  def create
    if params[:membertype] == "employer" 
      employer = Employer.find_by(email: params[:session][:email].downcase)
        if employer && employer.authenticate(params[:session][:password])
          log_in_employer employer
          params[:session][:remember_me] == '1' ? rememberEmployer(employer) :forgetEmployer(employer)
          redirect_to :controller => 'static_pages', :action => 'Home'
        else
          flash[:danger] = 'Invalid email/password combination!'
          redirect_to :membertype=> "employer"
        end
    elsif params[:membertype] == "jobseeker"
    jobseeker = Jobseeker.find_by(email: params[:session][:email].downcase)
        if jobseeker && jobseeker.authenticate(params[:session][:password])
          log_in_jobseeker jobseeker 
          params[:session][:remember_me] == '1' ? rememberJobseeker(jobseeker) :forgetJobseeker(jobseeker)
          redirect_to :controller => 'static_pages', :action => 'Home'
        else
          flash[:danger] = 'Invalid email/password combination!'
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
