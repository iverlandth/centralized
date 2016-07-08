class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :event_start_at
      t.datetime :event_end_at
      t.text :address
      t.integer :status
      t.references :church, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
