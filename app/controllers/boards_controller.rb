class BoardsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @boards = Board.order(id: :asc)
  end
  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, notice: 'ボード作成!'
    else
      flash.now[:error] = '保存に失敗'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id]) #①変数に更新したいレコード情報を代入
    if @board.update(board_params)
      redirect_to boards_path, notice: '更新成功!'
    else
      flash.now[:error] = '更新に失敗'
      render 'edit'
    end
  end

  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to boards_path, notice: '削除しました'
  end
  

  private
    def board_params
      params.require(:board).permit(:title, :content)
    end
end
