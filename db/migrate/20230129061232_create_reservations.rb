class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :schedule_id, :null => false
      t.integer :sheet_id, :null => false
      t.date :date, :null => false
      t.string :name, limit: 255, :null => false
      t.string :email, limit: 50, :null => false

      t.timestamps
    end
  end
end
