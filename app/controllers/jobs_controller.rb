class JobsController < ApplicationController
  
  def show
    @job = Job.find(params[:id])
  end
  
  def new
    @job = Job.new
  end
  
  def create
    @job = current_employer.jobs.build(job_params)
    @job.skill_ids = params[:skills]
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
  
  def offer
    @job = Job.find(params[:job_id])
    @jobseeker = Jobseeker.find(params[:user_id])
    if (current_employer = @job.employer)
      @job.available = false
      AppMailer.jobseeker_notified(@job.employer.name, @job.name, @job.employer.email, @jobseeker.email, @jobseeker.name).deliver
      @job.save
    else
    	redirect_to :controller => 'errors', :action => 'not_found'
    end
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