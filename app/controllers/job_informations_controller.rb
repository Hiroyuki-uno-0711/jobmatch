class JobInformationsController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :jobhunter_user, only: [:new]

  def show
    @job_information = JobInformation.find(params[:id])
  end


  def new
    @job_information= JobInformation.new
  end


  def create
    @job_information= JobInformation.new(job_information_params)
    @job_information.user_id = current_user.id

    if @job_information.save
      redirect_to job_information_path(@job_information)
    else
      render 'new'
    end
  end


  def edit
    @job_information = JobInformation.find(params[:id])
  end


  def update
    @job_information = JobInformation.find(params[:id])
    if @job_information.update(job_information_params)
       redirect_to job_information_path(@job_information.id)
    else
      render 'edit'
    end
  end


  def destroy
    @job_information = JobInformation.find(params[:id])
    @job_information.destroy
    redirect_to user_path(current_user)
  end


  def search
    @job_informations = JobInformation.where("genre = ?", params[:genre]).where(income: params[:income_from]..params[:income_to]).where("area = ?", params[:area])
  end


  private


  def job_information_params
    params.require(:job_information).permit(:genre, :area, :income, :company, :title, :summary, :detail, :job_image)
  end

  def correct_user
      job_information = JobInformation.find(params[:id])
      user = job_information.user

      if current_user != user
        redirect_to root_path
      end
  end

  def jobhunter_user
    if current_user.user_status == '一般ユーザー'
      redirect_to root_path
    end
  end

end
