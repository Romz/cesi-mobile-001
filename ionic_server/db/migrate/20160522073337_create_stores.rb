class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :zipcode
      t.string :city
      t.text :hours

      t.timestamps null: false
    end
  end
end
