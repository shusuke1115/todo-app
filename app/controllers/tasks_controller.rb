class TasksController < ApplicationController
  def index
    @tasks = Task.where(board_id: params[:board_id])
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

  def edit
  end

  def update
  end
  def destroy
  end

  private
    def task_params
      params.require(:task).permit(:title, :content, :limit)
    end
end