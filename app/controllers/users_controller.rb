class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @job_informations = @user.job_informations.all

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
  end


  def index
  end


  def form
    @user = User.find(params[:id])
  end


  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end


  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end


  private


  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :phone_number, :career, :career_age, :career_detail, :email, :age, :profile_image, :user_status, :result, :expert, :comment)
  end

end
