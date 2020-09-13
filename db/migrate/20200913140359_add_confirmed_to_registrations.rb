class AddConfirmedToRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :confirmed, :boolean
  end
end
