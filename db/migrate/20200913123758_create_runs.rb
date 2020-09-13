class CreateRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :runs do |t|
      t.datetime :starting_at
      t.integer :registration_limit
      t.integer :registrations_booked

      t.timestamps
    end
  end
end
