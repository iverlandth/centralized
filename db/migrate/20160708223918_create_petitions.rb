class CreatePetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :petitions do |t|
      t.string :category
      t.string :title
      t.text :message
      t.integer :status
      t.references :church, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
