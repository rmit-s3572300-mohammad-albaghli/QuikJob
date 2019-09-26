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
  
  private
  
  def employer_params
    params.require(:employer).permit(:name, :email, :info, :password,
                                   :password_confirmation)
  end
    
end
