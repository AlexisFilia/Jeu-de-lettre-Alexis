class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
