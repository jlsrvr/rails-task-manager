class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @tasks = Task.new
  end

  def create
    @task = Task.new(allow_tasks)
    @task.save
    redirect_to tasks_path
  end

  def edit; end

  def update
    @task.update(allow_tasks)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def allow_tasks
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
