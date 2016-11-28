class AddColToTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :start_date, :datetime
    add_column :trips, :end_date, :datetime
  end
end
