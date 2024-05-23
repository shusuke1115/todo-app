class TasksController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @tasks = Task.where(board_id: params[:board_id])
    @board = Board.find(params[:board_id])
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build(user_id: current_user.id)
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    @task.user_id = current_user.id  
    if @task.save
      redirect_to board_tasks_path, notice: 'Task is create'
    else
      flash.now[:error] = '保存に失敗'
      render :new
    end
  end

  def show
    board = Board.find(params[:board_id])
    @task = board.tasks.find_by(user_id: board.user_id)
    @comments = Comment.where(task_id: @task.id)
  end

  def edit
    board = Board.find(params[:board_id])
    @task = board.tasks.find_by(user_id: board.user_id)
  end

  def update
    board = Board.find(params[:board_id])
    @task = board.tasks.find_by(user_id: board.user_id)
    if @task.update(task_params)
      redirect_to board_tasks_path, notice: 'Task is update'
    else
      flash.now[:error] = '更新に失敗'
      render 'edit'
    end
  end

  def destroy
    board = Board.find(params[:board_id])
    task = board.tasks.find_by(user_id: board.user_id)
    task.destroy!
    redirect_to board_tasks_path, notice: 'delete'
  end

  private
    def task_params
      params.require(:task).permit(:title, :content, :limit, :image)
    end
end