class AddParticipantsLimitToMeeting < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :participants_limit, :integer
  end
end
