class AddIdToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :trip_id, :integer
  end
end
