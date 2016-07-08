class CreateSubEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_events do |t|
      t.string :name
      t.string :description
      t.datetime :sub_event_start_at
      t.datetime :sub_event_end_at
      t.string :place
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
