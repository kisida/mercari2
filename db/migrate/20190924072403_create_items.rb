class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :seller_id, foreign_key: true
      t.integer :buyer_id, null: true, foreign_key: true
      t.string :name, null: false
      t.string :gender
      t.string :brand
      t.integer :size
      t.integer :condition
      t.string :postage, null: false
      t.integer :shipping, null: false
      t.string :area, null: false
      t.integer :day_before_shippment, null: false
      t.string :price, null: false
      t.text :text, null: false
      t.integer :status, null: false
      t.timestamps
    end
  end
end

