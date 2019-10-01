class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :seller, foreign_key: { to_table: :users }
      t.references :buyer, null: true, foreign_key: { to_table: :users }
      t.references :category, foreign_key: { to_table: :categories }
      t.string :name, null: false
      t.string :gender
      t.string :brand
      t.integer :size
      t.integer :condition
      t.integer :postage, null: false
      t.integer :shipping, null: false
      t.integer :area, null: false
      t.integer :day_before_shippment, null: false
      t.string :price, null: false
      t.text :text, null: false
      t.integer :status, default: 1
      t.timestamps
    end
  end
end
