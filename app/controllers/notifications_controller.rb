class NotificationsController < ApplicationController
  # 一般ユーザーは、「年齢」、「経験職種」、「経験年数」を入力していないと全ページに遷移できない設定
  before_action :jobhunter_user_blank


  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
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
