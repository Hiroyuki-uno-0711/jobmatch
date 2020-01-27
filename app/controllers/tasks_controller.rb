class TasksController < ApplicationController

  # 他ユーザーの情報は更新できないよう設定
  before_action :correct_user, only: [:edit, :update, :destroy]

  include CommonActions
  # 求職者（一般ユーザー）は全ページに遷移できない設定
  before_action :jobhunter_user

  # キャリアアドバイザーは「年齢」、「専門職種」、「挨拶文」を登録していないと全ページに遷移できない設定
  before_action :user_blank



  # タスク一覧ページを表示させる
  def index
    @task = Task.new
    @tasks = current_user.tasks.all.page(params[:page]).per(10)
  end


  # タスク編集ページを表示させる
  def edit
    @task = Task.find(params[:id])
  end


  # タスク内容を新規追加させる
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if @task.save
      redirect_to tasks_path
    else
      @tasks = current_user.tasks.all.page(params[:page]).per(10)
      render 'index'
    end
  end


  # タスク内容を更新させる
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
       redirect_to tasks_path
    else
      render 'edit'
    end
  end


  # タスクを削除（完了）させる
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end



  private


  # タスク内容を追加する際に許可するカラム
  def task_params
    params.require(:task).permit(:task_content, :complete_date)
  end


  # 他ユーザーの情報は更新できないよう設定
  def correct_user
      task = Task.find(params[:id])
      user = task.user

      if current_user != user
        redirect_to root_path
      end
  end


end
