class ChangeColumnInOwnerTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :owners, :restaurant_id
  end
end
