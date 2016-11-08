class TasksController < ApplicationController
  before_action :params_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(permission)
    @task.save
    redirect_to tasks_path
  end

  def edit

  end

  def update
    @task.update(permission)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def params_task
    @task = Task.find(params[:id])
  end

  def permission
    params.require(:task).permit(:name, :status)
  end

end
