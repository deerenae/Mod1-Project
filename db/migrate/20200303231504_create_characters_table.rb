class CreateCharactersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|      
      t.string :name
      t.references :klass 
      t.references :race
    end 
  end
end
