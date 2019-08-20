class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.jobs.ransack(params[:q])
    @jobs = @q.result(distinct: true).page(params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data @jobs.generate_csv, filename: "jobs-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def confirm_new
    @job = current_user.jobs.new(job_params)
    render :new unless @job.valid?
  end

  def create
    @job = current_user.jobs.new(job_params)

    if params[:back].present?
      render :new
      return
    end

    if @job.save
      JobMailer.creation_email(@job).deliver_now
      redirect_to @job, notice: "タスク「#{@job.name}」を登録しました。"
    else
      render :new
    end
  end


  def update
    @job.update!(job_params)
    redirect_to jobs_url, notice: "タスク「#{@job.name}」を更新しました。"
  end

  def destroy
    @job.destroy
    redirect_to jobs_url, notice: "タスク「#{@job.name}」を削除しました。"
  end

  def import
    current_user.jobs.import(params[:file])
    redirect_to jobs_url, notice: "タスクを追加しました"
  end

  private

  def job_params
    params.require(:job).permit(:name, :description, :image)
  end

  def set_job
    @job = current_user.jobs.find(params[:id])
  end
end
