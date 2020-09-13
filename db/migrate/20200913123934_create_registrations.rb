class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|

      t.timestamps
    end
  end
end
