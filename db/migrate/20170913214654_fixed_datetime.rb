class FixedDatetime < ActiveRecord::Migration[5.0]
  def up
    change_column :reservations, :reservation_date, :date
    change_column :reservations, :reservation_time, :time
    change_column :restaurants, :opening_time, :time
    change_column :restaurants, :closing_time, :time

  end

  def down
    change_column :reservations, :reservation_date, :datetime
    change_column :reservations, :reservation_time, :datetime
    change_column :restaurants, :opening_time, :datetime
    change_column :restaurants, :closing_time, :datetime
  end


end
