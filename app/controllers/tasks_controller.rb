class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @time = Time.new
  end

  def new
    @task = Task.new
    @time = Time.new
    @tasks = Task.all
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @task.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to :tasks
    else
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
    @time = Time.new
    @tasks = Task.all
  end

  def edit
    @task = Task.find(params[:id])
    @time = Time.new
    @tasks = Task.all
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:success] = "スケジュールを編集しました"
      redirect_to :tasks
    else
      render "edit"
    end
  end

  def destroy
    @user = Task.find(params[:id])
    @user.destroy
    flash[:delete] = "スケジュールを削除しました"
    redirect_to :tasks
  end
end
