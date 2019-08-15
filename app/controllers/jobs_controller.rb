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
    @job = Job.find(params[:id])
  end

  def create
    job = Job.new(job_params)
    job.save!
    redirect_to jobs_url, notice: "タスク「#{job.name}」を登録しました。"
  end

  def update
    job = Job.find(params[:id])
    job.update!(job_params)
    redirect_to jobs_url, notice: "タスク「#{job.name}」を更新しました。"
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    redirect_to jobs_url, notice: "タスク「#{job.name}」を削除しました。"
  end

  private

  def job_params
    params.require(:job).permit(:name, :description)
  end
end
