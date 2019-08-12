class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    job = Job.new(job_params)
    job.save!
    redirect_to jobs_url, notice: "タスク「#{job.name}」を登録しました。"
  end

  private

  def job_params
    params.require(:job).permit(:name, :description)
  end
end
