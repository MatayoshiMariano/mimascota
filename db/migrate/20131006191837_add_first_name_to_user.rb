class AddFirstNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_column :users, :cellphone, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string	
  end
end
