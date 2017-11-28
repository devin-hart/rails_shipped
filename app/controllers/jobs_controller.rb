class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    find_params
    @boats = Boat.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.new(job_params)
    if @job.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @job = Job.find_by_id(params[:id])
    if @job.update(job_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  def destroy
    find_params
    @job.destroy
    redirect_to root_path
  end

  private

  def job_params
    params.require(:job).permit(:description, :origin, :destination, :cost, :containers, :boat_ids)
  end

  def find_params
    @job = Job.find(params[:id])
  end
end
