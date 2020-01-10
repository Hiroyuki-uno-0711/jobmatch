class JobInformationsController < ApplicationController

  def search
    @job_informations = JobInformation.where("genre = ?", params[:genre]).where("income = ?", params[:income]).where("area = ?", params[:area])
  end

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


  private


  def job_information_params
    params.require(:job_information).permit(:genre, :area, :income, :company, :title, :summary, :detail, :job_image)
  end

end
