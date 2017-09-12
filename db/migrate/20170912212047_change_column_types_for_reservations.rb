class ChangeColumnTypesForReservations < ActiveRecord::Migration[5.0]
  def change
    change_column :reservations, :reservation_date, :datetime
    change_column :reservations, :reservation_time, :datetime
  end
end
