class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.date :reservation_date

      t.timestamps
    end
  end
end
