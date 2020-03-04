class CreateKlassesTable < ActiveRecord::Migration[6.0]
  def change
    create_table klasses do |t|
      t.string :klass_name
  end
end
