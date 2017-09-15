class ChangeDateTimeFieldsToIntegers < ActiveRecord::Migration[5.0]
  def up
    change_column :reservations, :reservation_time, :integer
    change_column :restaurants, :opening_time, :integer
    change_column :restaurants, :closing_time, :integer
  end

  def down
    change_column :reservations, :reservation_time, :datetime
    change_column :restaurants, :opening_time, :datetime
    change_column :restaurants, :closing_time, :datetime
  end

end
