class AddCustomToUser < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :text
    add_column :users, :DOB, :date
    add_column :users, :gender, :string
  end
end
