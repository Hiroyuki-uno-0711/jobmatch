class FavoritesController < ApplicationController

  # 一般ユーザーは、「年齢」、「経験職種」、「経験年数」を入力していないと全ページに遷移できない設定
  before_action :jobhunter_user_blank


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



  def jobhunter_user_blank
    user = current_user
    if user.user_status == '一般ユーザー'
      if user.age.blank? or user.career.blank? or user.career_age.blank?
        flash[:error] = "※「年齢」、「経験職種」、「経験年数」をすべて登録してください"
        redirect_to form_user_path(user)
      end
    end
  end

end
