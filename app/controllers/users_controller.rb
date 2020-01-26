class UsersController < ApplicationController

  before_action :authenticate_user!

  # 他ユーザーの情報は更新できないよう設定
  before_action :correct_user, only: [:edit, :update, :destroy, :form]

  # 一般ユーザは、他の一般ユーザーの情報を閲覧できないように設定
  before_action :jobhunter_user_restriction, only: [:show, :favorites, :form, :follows, :followers]


  include CommonActions
  # 一般ユーザーは「年齢」、「経験職種」、「経験年数」を登録していないと全ページに遷移できない設定
  # キャリアアドバイザーは「年齢」、「専門職種」、「挨拶文」を登録していないと全ページに遷移できない設定
  before_action :user_blank, only: [:show, :edit, :search, :follows, :followers, :favorites]

  # 一般ユーザーは「ユーザー検索」ページへ遷移できないよう設定
  before_action :jobhunter_user, only: [:search]




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


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end


  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end


  def search
    @users = User.where("career = ?", params[:career]).where("career_age >= ?", params[:career_age]).where(age: params[:age_from]..params[:age_to]).page(params[:page]).per(10)
  end


  def form
    @user = User.find(params[:id])
  end


  def follows
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(20)
    # 他ユーザーのフォローは閲覧できないように設定
    if current_user != @user
      redirect_to root_path
    end
  end


  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(20)
    # 他ユーザーのフォロワーーは閲覧できないように設定
    if current_user != @user
      redirect_to root_path
    end
  end


  def favorites
    @user = User.find(params[:id])
    @job_informations = @user.favorites.page(params[:page]).per(15)
  end



  private



  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :phone_number, :career, :career_age, :career_detail, :email, :age, :profile_image, :user_status, :result, :expert, :comment)
  end


  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to root_path
    end
  end


  def jobhunter_user_restriction
    @user = User.find(params[:id])
    if current_user != @user && current_user.user_status == '一般ユーザー' && @user.user_status == '一般ユーザー'
      redirect_to root_path
    end
  end


end
