class JobseekersController < ApplicationController
  
  def new
    @jobseeker = Jobseeker.new
  end
  
  def show
    @jobseeker = Jobseeker.find(params[:id])
  end
  
  def create
    @jobseeker = Jobseeker.new(jobseeker_params)
    if @jobseeker.save
      flash[:success] = "Welcome to QuikJob!"
      redirect_to @jobseeker
    else
      render 'new'
    end
  end
  
  #Define params
  private
    def jobseeker_params
      params.require(:jobseeker).permit(:name, :email, :password, :password_confirmation)
    end

end
