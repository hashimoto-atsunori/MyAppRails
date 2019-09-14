=begin
The MIT License (MIT)

Copyright (c) 2019 Hashimoto Atsunori.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
=end

class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  #ログイン後の初期画面
  def index
    @q = current_user.jobs.ransack(params[:q])
    @jobs = @q.result(distinct: true).page(params[:page]).order(created_at: :desc)

    respond_to do |format|
      format.html
      format.csv { send_data @jobs.generate_csv, filename: "jobs-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end

    #初期画面から登録する
    @job = Job.new

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

    if @job.name.blank?
      @job.name = '名無しのタスク'
    end

    if params[:back].present?
      render :new
      return
    end

    if @job.save
      JobMailer.creation_email(@job).deliver_now
      redirect_to jobs_url, notice: "タスク「#{@job.name}」を登録しました。"
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

  #CSVインポート
  def import
    file = params[:file]

    if file.nil? then
      redirect_to jobs_url, notice: "CSVを設定してください"
    else
      current_user.jobs.import(params[:file])
      redirect_to jobs_url, notice: "タスクを追加しました"
    end
  end



  private

  def job_params
    params.require(:job).permit(:name, :description, :image, :start_time)
  end

  def set_job
    @job = current_user.jobs.find(params[:id])
  end
end
