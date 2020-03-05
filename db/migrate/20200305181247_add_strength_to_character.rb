class AddStrengthToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :strength, :integer
  end
end
