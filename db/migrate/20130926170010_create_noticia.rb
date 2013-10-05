class CreateNoticia < ActiveRecord::Migration
  def change
    create_table :noticia do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
