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
      log_in_jobseeker @jobseeker 
      flash[:success] = "Welcome to QuikJob!"
      redirect_to @jobseeker
    else
      render 'new'
    end
  end
  
  def edit
    @jobseeker = Jobseeker.find(params[:id])
    if(current_jobseeker != @jobseeker)
    	redirect_to :controller => 'errors', :action => 'not_found'
    end
  end
  
  def edit_skills
    @jobseeker = Jobseeker.find(params[:id])
    if(current_jobseeker != @jobseeker)
    	redirect_to :controller => 'errors', :action => 'not_found'
    end
  end
  
  def add_skills
    @jobseeker = Jobseeker.find(params[:id])
    @jobseeker.skill_ids = params[:skills]
    @jobseeker.save
    redirect_to @jobseeker
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
      params.require(:jobseeker).permit(:name, :email, :description, :password, :password_confirmation)
    end

end