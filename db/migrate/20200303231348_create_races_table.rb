class CreateRacesTable < ActiveRecord::Migration[6.0]
  def change
    creat_table races do |t|
      t.string :race_name
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
  end
end
