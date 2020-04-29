class GamesController < ApplicationController
  def new
    @game = Game.new()
  end

  def create
    @game = Game.create(user: current_user)
    redirect_to new_game_party_path(@game)
  end

  def show
    @game = Game.find(params[:id])
    @parties = @game.parties
    total_score = 0
    @parties.each do |partie|
      total_score += partie.score
    end
    @game.update(:total_score total_score)
  end
end
