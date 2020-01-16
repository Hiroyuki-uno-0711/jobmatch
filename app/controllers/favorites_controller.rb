class FavoritesController < ApplicationController

  def create
    @job_information = JobInformation.find(params[:job_information_id])
    favorite = current_user.favorites.new(job_information_id: @job_information.id)
    favorite.save

    notification = @job_information.create_notification_like!(current_user)

    render 'job_informations/index.js.erb'

    inquiry = Inquiry.new(name: "運営部", message: "あなたの求人に興味ボタンが押されました。マイページよりご確認ください。", email: @job_information.user.email)
    InquiryMailer.send_mail(inquiry).deliver_now

  end

  def destroy
    @job_information = JobInformation.find(params[:job_information_id])
    favorite = current_user.favorites.find_by(job_information_id: @job_information.id)
    favorite.destroy

    render 'job_informations/index.js.erb'

  end

end
