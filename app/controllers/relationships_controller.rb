class RelationshipsController < ApplicationController

  def create
    # フォロー情報保存
    @user = User.find(params[:user_id])
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save

    # 通知保存
    follow.create_notification_follow!(current_user)

    # 非同期設定
    render 'users/index.js.erb'

    # inquiry = Inquiry.new(name: "運営部", message: "ユーザーよりフォローされました。マイページより詳細をご確認ください。", email: User.find(params[:user_id]).email)
    # InquiryMailer.send_mail(inquiry).deliver_now
    EmailDeliverJob.perform_later(User.find(params[:user_id]).email, "ユーザーよりフォローされました。マイページより詳細をご確認ください。")

  end


  def destroy
    @user = User.find(params[:user_id])
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy

    render 'users/index.js.erb'
  end


end
