class FavoritesController < ApplicationController

  def create
    job_information = JobInformation.find(params[:job_information_id])
    favorite = current_user.favorites.new(job_information_id: job_information.id)
    favorite.save

    notification = job_information.create_notification_like!(current_user)

    inquiry = Inquiry.new(name: "運営部", message: "通知連絡", email: notification.visiter.email)
    InquiryMailer.send_mail(inquiry).deliver_now

    redirect_to request.referrer
  end

  def destroy
    job_information = JobInformation.find(params[:job_information_id])
    favorite = current_user.favorites.find_by(job_information_id: job_information.id)
    favorite.destroy
    redirect_to request.referrer
  end

end
