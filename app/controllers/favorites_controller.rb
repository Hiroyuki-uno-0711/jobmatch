class FavoritesController < ApplicationController

  def create
    job_information = JobInformation.find(params[:job_information_id])
    favorite = current_user.favorites.new(job_information_id: job_information.id)
    favorite.save
    redirect_to request.referrer
  end

  def destroy
    job_information = JobInformation.find(params[:job_information_id])
    favorite = current_user.favorites.new(job_information_id: job_information.id)
    favorite.destroy
    redirect_to request.referrer
  end

end
