class ChangeColumnTypesForReservations < ActiveRecord::Migration[5.0]
  def up
    change_column :reservations, :reservation_date, :datetime
    change_column :reservations, :reservation_time, :datetime
  end

  def down
    change_column :reservations, :reservation_date, :date
    change_column :reservations, :reservation_time, :time
  end
end
