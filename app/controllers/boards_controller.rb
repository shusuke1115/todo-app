class BoardsController < ApplicationController
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
      redirect_to boards_path, notice: 'Board is create'
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
    else
      flash.now[:error] = '更新に失敗'
      render 'edit'
    end

    def destroy
      board = current_user.boards.find(params[:id])
      board.destroy!
      redirect_to boards_path, notice: 'delete'
    end
  end

  private
    def board_params
      params.require(:board).permit(:title, :content)
    end
end
