class AddBirthmonthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthmonth, :integer
  end
end
