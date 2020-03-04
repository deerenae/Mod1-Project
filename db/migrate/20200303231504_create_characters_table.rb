class CreateCharactersTable < ActiveRecord::Migration[6.0]
  def change
    t.string :name
    t.references :klass 
    t.references :race
  end
end
