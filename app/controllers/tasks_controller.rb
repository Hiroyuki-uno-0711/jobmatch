class TasksController < ApplicationController

  def index
    @task = Task.new
    @tasks = current_user.tasks.all.page(params[:page]).per(10)
  end


  def edit
    @task = Task.find(params[:id])
  end


  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if @task.save
      redirect_to tasks_path
    else
      render 'index'
    end
  end


  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
       redirect_to tasks_path
    else
      render 'edit'
    end
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end


  private


  def task_params
    params.require(:task).permit(:task_content, :complete_date)
  end


end
