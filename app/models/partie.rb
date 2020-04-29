class Partie < ApplicationRecord
  belongs_to :game

  has_many :solutions

  validates :word, presence: true
end
