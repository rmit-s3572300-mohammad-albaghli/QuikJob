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
    @temptSkills = @jobseeker.skills
    if params[:form_action].eql?"custom"
      if Skill.find_by(name: params[:jobseeker][:custom_skill])
        @new_skill = Skill.find_by(name: params[:jobseeker][:custom_skill])
      else
        @new_skill = Skill.new(name: params[:jobseeker][:custom_skill])
      end
    else
     @new_skill = Skill.find(params[:skills])
    end
    unless @jobseeker.skills.include?(@new_skill)
      @jobseeker.skills << @new_skill
    else
      flash[:danger] = "The selected skill has already been added"
    end
    redirect_to :controller => 'jobseekers', :action => 'edit_skills', :id => @jobseeker.id
  end
  
  def delete_skills
    @jobseeker = Jobseeker.find(params[:id])
    @skill = Skill.find(params[:skill_id])
    @jobseeker.skills.delete(@skill)
    redirect_to :controller => 'jobseekers', :action => 'edit_skills', :id => @jobseeker.id
  end
  
  def confirm_skills
    @jobseeker = Jobseeker.find(params[:id])
    redirect_to @jobseeker
  end
  
  def search_json

    @jobseekers_search = Jobseeker.ransack(params[:q])

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
      params.require(:jobseeker).permit(:name, :email, :description, :password, :password_confirmation, :custom_skill, :pdf)
    end

end