class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :name
      t.references :product, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true
      t.decimal :price

      t.timestamps null: false
    end
  end
end
