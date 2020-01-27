class UsersController < ApplicationController

  before_action :authenticate_user!

  # 他ユーザーの情報は更新できないよう設定
  before_action :correct_user, only: [:edit, :update, :destroy, :form]

  # 自分と同じステータスを持つ他ユーザーの情報を閲覧できないように設定
  before_action :same_status_user, only: [:show, :favorites, :form, :follows, :followers]

  # 一般ユーザーは「ユーザー検索」ページへ遷移できないよう設定
  before_action :jobhunter_user, only: [:search]


  include CommonActions
  # 一般ユーザーは「年齢」、「経験職種」、「経験年数」を登録していないと全ページに遷移できない設定
  # キャリアアドバイザーは「年齢」、「専門職種」、「挨拶文」を登録していないと全ページに遷移できない設定
  before_action :user_blank, only: [:show, :edit, :search, :follows, :followers, :favorites]




  # ユーザー詳細画面を表示させる
  def show
    @user = User.find(params[:id])

    @job_informations = @user.job_informations.all.page(params[:page]).per(8)

    # チャット関連のアクション
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)

    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end

      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end

  end


  # ユーザー情報の編集画面を表示させる
  def edit
    @user = User.find(params[:id])
  end


  # ユーザー情報をアップデートさせる
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end


  # ユーザー情報を削除させる
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end


  # ユーザー検索ページを表示させる
  def search
    @users = User.where("career = ?", params[:career]).where("career_age >= ?", params[:career_age]).where(age: params[:age_from]..params[:age_to]).page(params[:page]).per(10)
  end


  # 新規登録後の追加項目ページを表示させる
  def form
    @user = User.find(params[:id])
  end


  # フォロー一覧ページを表示させる
  def follows
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(20)
    # 他ユーザーのフォローは閲覧できないように設定
    if current_user != @user
      redirect_to root_path
    end
  end


  # フォロワー一覧ページを表示させる
  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(20)
    # 他ユーザーのフォロワーーは閲覧できないように設定
    if current_user != @user
      redirect_to root_path
    end
  end


  # お気に入り求人ページを表示させる
  def favorites
    @user = User.find(params[:id])
    @job_informations = @user.favorites.page(params[:page]).per(15)
  end



  private


  # ユーザー情報をアップデートさせる際に許可するカラム
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :phone_number, :career, :career_age, :career_detail, :email, :age, :profile_image, :user_status, :result, :expert, :comment)
  end


  # 他ユーザーの情報は更新できないよう設定
  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to root_path
    end
  end


  # 自分と同じステータスを持つ他ユーザーの情報を閲覧できないように設定
  def same_status_user
    @user = User.find(params[:id])
    if current_user != @user && current_user.user_status == '一般ユーザー' && @user.user_status == '一般ユーザー'
      redirect_to root_path
    end

    if current_user != @user && current_user.user_status == 'キャリアアドバイザー' && @user.user_status == 'キャリアアドバイザー'
      redirect_to root_path
    end

  end


end
