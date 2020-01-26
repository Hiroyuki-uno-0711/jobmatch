module CommonActions

  extend ActiveSupport::Concern

  # 一般ユーザーは「年齢」、「経験職種」、「経験年数」を登録していないと全ページに遷移できない設定
  # キャリアアドバイザーは「年齢」、「専門職種」、「挨拶文」を登録していないと全ページに遷移できない設定
  def user_blank

    user = current_user

    if user.user_status == '一般ユーザー'
      if user.age.blank? or user.career.blank? or user.career_age.blank?
        flash[:error] = "※「年齢」、「経験職種」、「経験年数」をすべて登録してください"
        redirect_to form_user_path(user)
      end
    end

    if user.user_status == 'キャリアアドバイザー'
      if user.age.blank? or user.expert.blank? or user.comment.blank?
        flash[:error] = "※「年齢」、「専門領域」、「あいさつ文」をすべて登録してください"
        redirect_to form_user_path(user)
      end
    end
  end


  # 一般ユーザーは「キャリアアドバイザー」専用のページには遷移できないよう設定
  def jobhunter_user
    if current_user.user_status == '一般ユーザー'
      redirect_to root_path
    end
  end



end