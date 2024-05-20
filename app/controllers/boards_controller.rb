class BoardsController < ApplicationController
  def index
    @boards = Board.all
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
  private
    def board_params
      params.require(:board).permit(:title, :content)
    end
end
