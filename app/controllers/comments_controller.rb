class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @task = Task.find(id: params[:task_id])
    @comments = Comments.where(task_id: @task.id)
  end

  def new
    @comment = current_user.comments.build(task_id: params[:task_id])
  end

  def create
    @task = Task.find(params[:task_id])
    @comment = current_user.comments.build(comment_params)
    @comment.task = @task
    if @comment.save
      redirect_to board_task_path(@task.board_id, @task),notice: 'コメントできたよ'
    else
      flash.now[:error] = 'コメント失敗'
      render :new
    end
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end