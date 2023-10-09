class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :passengers
      t.references :flights

      t.timestamps
    end
  end
end
