class JobsController < ApplicationController
  # Prevent none employers from creating a job post
  # before_action :logged_in_employer?, only: [:create, :destroy]
  
  def show
    @job = Job.find(params[:id])
  end
  
  def new
    @job = Job.new
  end
  
  def create
    @job = current_employer.jobs.build(job_params)
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
