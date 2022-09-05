class AddCoordsToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :latitude, :decimal
    add_column :meetings, :longitude, :decimal
  end
end
