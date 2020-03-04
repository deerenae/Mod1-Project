class CreateRacesTable < ActiveRecord::Migration[6.0]
  def change
    creat_table races do |t|
      t.string :race_name
  end
end
