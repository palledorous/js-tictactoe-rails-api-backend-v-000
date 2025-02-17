class GamesController < ApplicationController
  # Add your GamesController code here

  def index
    @games = Game.all
    render json: @games
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: @game
    end
  end

  def show
    @game = Game.find_by(id: params[:id])
    render json: @game
  end

  def update
    @game = Game.find_by(id: params[:id])
    if @game.update(game_params)
      render json: @game
    end
  end

  private

    def game_params
      params.permit(state: [])
    end

end
