class AddWordToSolutions < ActiveRecord::Migration[6.0]
  def change
    add_column :solutions, :word, :string
  end
end
