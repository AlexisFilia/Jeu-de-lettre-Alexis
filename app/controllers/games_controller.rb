class GamesController < ApplicationController
  def new
    @game = Game.new()
  end

  def create
    @game = Game.create(user: current_user)
    redirect_to new_game_party_path(@game)
  end

  def show
  end
end
