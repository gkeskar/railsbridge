class JobsController < ApplicationController
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction
  def index
    if params[:tag]
      @jobs = Job.tagged_with_id(params[:tag])
      puts params
    else
      @jobs = Job.order(sort_column + ' ' + sort_direction)
    end
  end

  def new
    @job = Job.new
  end
  def create
    Job.create(job_params)
    redirect_to jobs_path
  end
  def edit
    @job = Job.find(params[:id])
  end
  def update
    @job = Job.find(params[:id])
    @job.update_attributes(job_params)
    redirect_to jobs_path
  end
  def show
    @job = Job.find(params[:id])

  end
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  def job_params
    params.require(:job).permit(:title, :description, :location, :date_posted, :skill_level, :employment_type, :tag_list)
  end

  private
  def sort_column
    Job.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
