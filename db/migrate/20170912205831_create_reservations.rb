class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.time :reservation_time
      t.integer :party_size
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
