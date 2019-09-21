class AddLastkanaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lastkana, :string
  end
end
