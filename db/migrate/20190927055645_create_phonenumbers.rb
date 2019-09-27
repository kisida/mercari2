class CreatePhonenumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :phonenumbers do |t|
      t.integer :user_id, null: false, foreign_key:true
      t.string :phone_number
      t.timestamps
    end
  end
end
