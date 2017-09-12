class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|

      t.string :name
      t.text :summary
      t.string :street_address
      t.string :city
      t.string :province
      t.string :postal_code
      t.integer :phone
      t.string :email
      t.integer :menu_id
      t.integer :max_capacity
      t.integer :max_time_slots
      t.time :opening_time
      t.time :closing_time

      t.timestamps
    end
  end
end
