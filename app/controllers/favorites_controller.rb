class FavoritesController < ApplicationController

  def create
    # お気に入り保存
    @job_information = JobInformation.find(params[:job_information_id])
    favorite = current_user.favorites.new(job_information_id: @job_information.id)
    favorite.save

    # 通知保存
    notification = @job_information.create_notification_like!(current_user)

    # 非同期設定
    render 'job_informations/index.js.erb'

    # アクションメーラー起動
    EmailDeliverJob.perform_later(@job_information.user.email, "あなたの求人に興味ボタンが押されました。マイページより詳細をご確認ください。")

  end

  def destroy
    @job_information = JobInformation.find(params[:job_information_id])
    favorite = current_user.favorites.find_by(job_information_id: @job_information.id)
    favorite.destroy

    render 'job_informations/index.js.erb'

  end

end
