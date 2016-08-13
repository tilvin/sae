class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :name
      t.string :port_id
      t.integer :volume
      t.date :date

      t.timestamps null: false
    end
  end
end
