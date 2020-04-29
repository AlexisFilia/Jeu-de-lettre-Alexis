class AddChampsToParties < ActiveRecord::Migration[6.0]
  def change
    add_column :parties, :ten_letters_list, :string
    add_column :parties, :available, :boolean
  end
end
