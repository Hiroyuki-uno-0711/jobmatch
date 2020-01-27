class JobInformationsController < ApplicationController

  before_action :authenticate_user!

  # 他ユーザーの情報は更新できないよう設定
  before_action :correct_user, only: [:edit, :update, :destroy]


  include CommonActions
  # 一般ユーザーは「年齢」、「経験職種」、「経験年数」を登録していないと全ページに遷移できない設定
  # キャリアアドバイザーは「年齢」、「専門職種」、「挨拶文」を登録していないと全ページに遷移できない設定
  before_action :user_blank

  # 求職者（一般ユーザー）は求人追加ページに遷移できない設定
  before_action :jobhunter_user, only: [:new]




  # 求人詳細ページを表示させる
  def show
    @job_information = JobInformation.find(params[:id])
  end


  # 求人追加ページを表示させる
  def new
    @job_information= JobInformation.new
  end


  # 求人を新規追加させる
  def create
    @job_information= JobInformation.new(job_information_params)
    @job_information.user_id = current_user.id

    if @job_information.save
      redirect_to job_information_path(@job_information)
    else
      render 'new'
    end
  end


  # 求人編集ページを表示させる
  def edit
    @job_information = JobInformation.find(params[:id])
  end


  # 求人情報を更新させる
  def update
    @job_information = JobInformation.find(params[:id])
    if @job_information.update(job_information_params)
       redirect_to job_information_path(@job_information.id)
    else
      render 'edit'
    end
  end


  # 求人を削除させる
  def destroy
    @job_information = JobInformation.find(params[:id])
    @job_information.destroy
    redirect_to user_path(current_user)
  end


  # 求人検索ページを表示させる
  def search
    @job_informations = JobInformation.where("genre = ?", params[:genre]).where(income: params[:income_from]..params[:income_to]).where("area = ?", params[:area]).page(params[:page]).per(10)
  end



  private



  # 他ユーザーの情報は更新できないよう設定
  def correct_user
      job_information = JobInformation.find(params[:id])
      user = job_information.user

      if current_user != user
        redirect_to root_path
      end
  end


  # 求人を追加する際に許可するカラム
  def job_information_params
    params.require(:job_information).permit(:genre, :area, :income, :company, :title, :summary, :detail, :job_image)
  end



end
