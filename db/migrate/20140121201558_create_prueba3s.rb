class CreatePrueba3s < ActiveRecord::Migration
  def change
    create_table :prueba3s do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
