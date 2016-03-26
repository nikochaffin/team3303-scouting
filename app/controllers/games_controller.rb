class GamesController < ApplicationController
  before_action :admin_user

  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:success] = "Game #{ @game.name } created"
      redirect_to games_url
    else
      render 'new'
    end
  end

  def edit
    @game = Game.find_by(params[:id])
  end

  def update
    @game = Game.find_by(params[:id])
    if @game.update_attributes(game_params)
      flash[:success] = "Game #{ @game.name } updated"
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    Game.find_by(params[:id]).destroy
  end

  private

    def game_params
      params.require(:game).permit(:name, :year,
                                   fields_attributes: [:id, :name, :field_type,
                                                       :range_min, :range_max,
                                                       :_destroy, :options_list])
    end
end