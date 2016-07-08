class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :type_meeting
      t.integer :day
      t.datetime :meeting_start_at
      t.datetime :meeting_end_at
      t.text :address
      t.integer :status
      t.references :church, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
