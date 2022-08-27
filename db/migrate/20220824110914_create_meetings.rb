class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :address, null: false
      t.datetime :started_at, null: false
      t.integer :duration, null: false
      t.datetime :finished_at, null: false

      t.timestamps
    end
  end
end
