class PartiesController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @parties = @game.parties
    if @parties.count < 6
      ten_letters_list = Party.letters_generation
      @party = Party.new(game: @game, ten_letters_list: ten_letters_list.join, word: "A remplir")
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
    word = party_params[:word].downcase
    word_letters = word.split("")
    ten_letters_list = @party.ten_letters_list.downcase.split("")
    word_letters.each do |letter|
      if ten_letters_list.include?(letter)
        position = ten_letters_list.index(letter)
        ten_letters_list.delete_at(position)
      else
        raise
        @parties = @game.parties
        @vowels = @party.ten_letters_list.split("").first(5)
        @consonnes = @party.ten_letters_list.split("").last(5)
        render "parties/new" and return
      end
    end
    file_dico = File.open("public/liste_francais.txt")
    array_dico =file_dico.readlines.map(&:chomp)
    # Attention aux caratères speciaux... grrrrr
    # array_dico.map do |french_word|
    #   french_word.downcase
    # end
    if array_dico.include?(word)
      score = word.length
      @party.update(score: score)
      raise
    else
      raise
      @parties = @game.parties
      @vowels = @party.ten_letters_list.split("").first(5)
      @consonnes = @party.ten_letters_list.split("").last(5)
      render "parties/new" and return
    end
  end

  private

  def party_params
    params.require(:party).permit(:word)
  end
end
