class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後はマイページに遷移させる
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end


  # ログアウト後はTOPページに遷移させる
  def after_sign_out_path_for(resource)
    root_path
  end


  protected


  # 新規登録の際に許可するカラム
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :phone_number, :email, :age, :user_status])
  end

end
