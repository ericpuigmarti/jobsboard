class JobsController < ApplicationController
  before_action :find_job, only: [:edit, :update, :destroy]
  def index
    # @jobs = Job.all
    # Limit to 25 with pagination
    # Order by most recent
    @jobs = Job.page(params[:page]).per(25).order('created_at DESC')
  end

  def new
  	@job = Job.new
  end

  # Create new posting
  # Require :title, :company, :city, :url
  def create
    @job = Job.new(params.require(:job).permit(:title, :company, :city, :url))
  	if @job.save
	  redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(params.require(:job).permit(:title, :company, :city, :url))
      redirect_to root_path
    else
      render 'edit'
    end
  end

  # Delete jobs
  # (Not working yet...)
  def destroy
    @job.destroy
    redirect_to root_path, alert: "Job offer succesfully deleted"
  end

  private

  def jobs_params
    params.require(:job).permit(:title, :company, :city, :url)
  end

  def find_job
    @job = Job.find(params[:id])
  end

  # Voting
  # def upvote
  #   @job = Job.find(params[:id])
  #   @job.votes.create
  #   redirect_to root_path
  # end

end




