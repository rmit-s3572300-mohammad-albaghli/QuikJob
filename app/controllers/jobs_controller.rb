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

  private
  def job_params
    params.require(:job).permit(:name, :info, :requirements)
  end
  
end
