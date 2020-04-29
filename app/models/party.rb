class Party < ApplicationRecord
  belongs_to :game

  has_many :solutions

  validates :word, presence: true

  def self.letters_generation
    ten_letters_list = []
    vowels = "AEIOUY"
    consonants = "BCDFGHJKLMNPQRSTVWXZ"
    vowels_array = vowels.split("")
    consonants_array = consonants.split("")
    for i in (0...5)
      ten_letters_list << vowels_array.sample
    end
    for i in (0...5)
      ten_letters_list << consonants_array.sample
    end
    return ten_letters_list
  end
end
