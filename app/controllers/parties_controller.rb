class PartiesController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @parties = @game.parties
    if @parties.count < 6
      ten_letters_list = Party.letters_generation
      @party = Party.new(game: @game, ten_letters_list: ten_letters_list, word: "A remplir")
      @party.save!
      @parties = @game.parties
      @vowels = ten_letters_list.first(5)
      @consonnes = ten_letters_list.last(5)
    else
      raise
      redirect_to game_path(@game)
    end
  end

  def show
    @party = Party.find(params[:id])
    @game = @party.game

    raise
  end

  private

  def party_params
    params.require(:party).permit(:word)
  end
end
