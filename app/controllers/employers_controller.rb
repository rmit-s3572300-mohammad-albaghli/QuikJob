class EmployersController < ApplicationController
  def show
    @employer = Employer.find(params[:id])
  end
  
  def new
    @employer = Employer.new
  end
  
  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      log_in_employer @employer
      flash[:success] = "Welcome to QuikJob!"
      redirect_to @employer
    else
      render 'new'
    end
  end
  
  def edit
    @employer = Employer.find(params[:id])
    if(current_employer != @employer)
      redirect_to :controller => 'errors', :action => 'not_found'
    end
  end
  
  def update
    @employer = Employer.find(params[:id])
    if @employer.update_attributes(employer_params)
      flash[:success] = "Successfully updated your profile!"
      redirect_to @employer
    else
      render 'edit'
    end
  end
  
  private
  
  def employer_params
    params.require(:employer).permit(:name, :email, :info, :password,
                                   :password_confirmation)
  end
    
end
