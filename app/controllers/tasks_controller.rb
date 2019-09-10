class TasksController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_name: task_params[:task_name], limit: task_params[:limit], user_id: current_user.id)
    redirect_to(tasks_path)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :limit)
  end
end
