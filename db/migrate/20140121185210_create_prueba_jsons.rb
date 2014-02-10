class CreatePruebaJsons < ActiveRecord::Migration
  def change
    create_table :prueba_jsons do |t|

      t.timestamps
    end
  end
end
