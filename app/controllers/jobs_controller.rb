class JobsController < ApplicationController
  
  def show
    @job = Job.find(params[:id])
  end
  
  def new
    @job = Job.new
    @test = "something"
    puts "TEST1"
    if params[:form_action].eql?"skill_add"
      puts "LOL"
      @test = "yup"
      @filter = Array.new
      if params[:skill_ids]
        params[:skill_ids].each do |skill_id|
          @tempt_skill = Skill.find(skill_id)
          @filter.push(@tempt_skill)
        end
      end 
      @skill = Skill.find(params[:skill_id])
      unless @filter.include?(@skill)
        @filter.push(@skill)
      end
    end
  end
  
  
  def search
    @filter = Array.new
    if params[:form_action].eql?"add_search"
      if params[:skill_ids]
        params[:skill_ids].each do |skill_id|
          @tempt_skill = Skill.find(skill_id)
          @filter.push(@tempt_skill)
        end
      end 
      @skill = Skill.find(params[:skill_id])
      unless @filter.include?(@skill)
        @filter.push(@skill)
      end
    else
      if params[:skill_ids]
        @skills = params[:skill_ids]
        @jobs = Array.new
        #add jobs into list based on filter
        Job.all.each do |job|
          @skills.each do |skill_id|
            skill = Skill.find(skill_id)
            @filter.push(skill)
            if job.skills.include?(skill) && @jobs.exclude?(job)
              @jobs.push(job)
            end
          end
        end
      end
    end
  end
  
  def create
    @job = current_employer.jobs.build(job_params)
    @job.skill_ids = params[:skills]
    @job.available = true
    if @job.save
      flash[:success] = "You have successfully listed a new job."
      redirect_to current_employer
    else
      render 'new'
    end
  end

  def destroy
  end

  def apply
    @job = Job.find(params[:job_id])
    @jobseeker = Jobseeker.find(params[:user_id])
    if (matched_job(@job, @jobseeker))
      @job = Job.find(params[:job_id])
      @job_jobseekers = @job.jobseeker_ids
      @job_jobseekers << params[:user_id]
      @job.jobseeker_ids = @job_jobseekers
      AppMailer.jobseeker_applied(@job.employer.name, @job.name, @job.employer.email, @jobseeker).deliver
      @job.save
      redirect_to @job
    else
    	redirect_to :controller => 'errors', :action => 'not_found'
    end
  end
  
  def withdraw
    @job = Job.find(params[:job_id])
    @jobseeker = Jobseeker.find(params[:user_id])
    if (matched_job(@job, @jobseeker))
      @job = Job.find(params[:job_id])
      @job.jobseekers.delete(@jobseeker)
      redirect_to @job
    else
    	redirect_to :controller => 'errors', :action => 'not_found'
    end
  end
  
  def offer
    @job = Job.find(params[:job_id])
    @jobseeker = Jobseeker.find(params[:user_id])
    if (current_employer = @job.employer)
      AppMailer.jobseeker_notified(@job.employer.name, @job.name, @job.employer.email, @jobseeker.email, @jobseeker.name).deliver
      @job.save
    else
    	redirect_to :controller => 'errors', :action => 'not_found'
    end
  end
  
  def close
    @job = Job.find(params[:job_id])
    @job.available = false
    @job.save
    redirect_to @job
  end
  
  def reopen
    @job = Job.find(params[:job_id])
    @job.available = true
    @job.save
    redirect_to @job
  end
  
  private
  def job_params
    params.require(:job).permit(:name, :info, :requirements)
  end
  
  def matched_job(job, jobseeker)
    job.skills.each do |skill|
        jobseeker.skills.each do |js_skill|
            if js_skill == skill
                return true
            end
        end
    end
    return false
  end
  
end