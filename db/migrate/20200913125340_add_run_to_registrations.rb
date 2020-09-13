class AddRunToRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_reference :registrations, :run, null: false, foreign_key: true
  end
end
