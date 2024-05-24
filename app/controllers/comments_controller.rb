class CommentsController < ApplicationController
  before_action :authenticate_user!


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
    task = Task.find(params[:task_id])
    comment = Comment.find(params[:id])
    comment.destroy!
    redirect_to board_task_path(task.board_id, task),notice: '削除しました'
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end