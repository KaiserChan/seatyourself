class ChangeColumnTypesForRestaurants < ActiveRecord::Migration[5.0]
  def change
    change_column :restaurants, :opening_time, :datetime
    change_column :restaurants, :closing_time, :datetime

  end
end
