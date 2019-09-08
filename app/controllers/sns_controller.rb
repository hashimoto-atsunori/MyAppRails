class SnsController < ApplicationController
  def index
    @jobs = Job.all.page(params[:page]).order(created_at: :desc)
    @user = User.all
  end

  def show
    @job = Job.find(params[:id])
  end
end
