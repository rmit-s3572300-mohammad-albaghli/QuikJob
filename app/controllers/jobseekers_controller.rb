class JobseekersController < ApplicationController
  
  def new
    @jobseeker = Jobseeker.new
  end
  
  def show
    @jobseeker = Jobseeker.find(params[:id])
    @skills = Skill.all
  end
  
  def create
    @jobseeker = Jobseeker.new(jobseeker_params)
    @jobseeker.skill_ids = params[:skills]
    if @jobseeker.save
      flash[:success] = "Welcome to QuikJob!"
      redirect_to @jobseeker
    else
      render 'new'
    end
  end
  
  def edit
    @jobseeker = Jobseeker.find(params[:id])
  end
  
  def update
    @jobseeker = Jobseeker.find(params[:id])
    @jobseeker.skill_ids = params[:skills]
    if @jobseeker.update_attributes(jobseeker_params)
      flash[:success] = "Successfully updated your profile!"
      redirect_to @jobseeker
    else
      render 'edit'
    end
  end
  
  #Define params
  private
    def jobseeker_params
      params.require(:jobseeker).permit(:name, :email, :password, :password_confirmation)
    end

end
