class RelationshipsController < ApplicationController

  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save

    follow.create_notification_follow!(current_user)

    inquiry = Inquiry.new(name: "運営部", message: "ユーザーよりフォローされました。マイページより詳細をご確認ください。", email: User.find(params[:user_id]).email)
    InquiryMailer.send_mail(inquiry).deliver_now

    redirect_to request.referrer
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to request.referrer
  end

end
