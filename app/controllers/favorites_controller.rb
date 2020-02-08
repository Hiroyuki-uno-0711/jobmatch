class FavoritesController < ApplicationController

  include CommonActions
  # 一般ユーザーは「年齢」、「経験職種」、「経験年数」を登録していないと全ページに遷移できない設定
  # キャリアアドバイザーは「年齢」、「専門職種」、「挨拶文」を登録していないと全ページに遷移できない設定
  before_action :user_blank, only: [:show, :edit, :search, :follows, :followers, :favorites]




  # お気に入り(イイネ)と通知情報を保存
  def create
    # お気に入り保存
    @job_information = JobInformation.find(params[:job_information_id])
    favorite = current_user.favorites.new(job_information_id: @job_information.id)
    favorite.save

    # 通知レコードを作成
    notification = @job_information.create_notification_like!(current_user)

    # 非同期設定
    render 'job_informations/index.js.erb'

    # アクションメーラー起動
    EmailDeliverJob.perform_later(@job_information.user.email, "あなたの求人に興味ボタンが押されました。マイページより詳細をご確認ください。")
  end



  # お気に入り(イイネ)を削除
  def destroy
    @job_information = JobInformation.find(params[:job_information_id])
    favorite = current_user.favorites.find_by(job_information_id: @job_information.id)
    favorite.destroy

    render 'job_informations/index.js.erb'
  end



end
