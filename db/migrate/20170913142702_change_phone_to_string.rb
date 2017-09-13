class ChangePhoneToString < ActiveRecord::Migration[5.0]
  def up
    change_column :restaurants, :phone, :string
  end

  def down
    change_column :restaurants, :phone, :integer
  end
end
